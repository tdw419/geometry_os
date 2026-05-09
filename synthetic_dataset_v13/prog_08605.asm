; DESCRIPTION: Renders a cyan box of size 119x16 starting at (390, 63).
; PLAN: r0=390(x), r1=63(y), r2=119(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 63
LDI r2, 119
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
