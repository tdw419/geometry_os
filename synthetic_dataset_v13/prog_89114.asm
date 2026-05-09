; DESCRIPTION: Places a cyan 73x65 rectangle at position (0, 78).
; PLAN: r0=0(x), r1=78(y), r2=73(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 78
LDI r2, 73
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
