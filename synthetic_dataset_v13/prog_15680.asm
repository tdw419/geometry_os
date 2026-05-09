; DESCRIPTION: Places a cyan 65x21 rectangle at position (57, 10).
; PLAN: r0=57(x), r1=10(y), r2=65(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 10
LDI r2, 65
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
