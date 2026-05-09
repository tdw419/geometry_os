; DESCRIPTION: Places a cyan 96x65 rectangle at position (227, 14).
; PLAN: r0=227(x), r1=14(y), r2=96(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 14
LDI r2, 96
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
