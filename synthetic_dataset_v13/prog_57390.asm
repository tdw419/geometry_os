; DESCRIPTION: Renders a green box of size 18x19 starting at (128, 175).
; PLAN: r0=128(x), r1=175(y), r2=18(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 175
LDI r2, 18
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
