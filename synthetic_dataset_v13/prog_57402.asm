; DESCRIPTION: Renders a blue box of size 75x107 starting at (254, 27).
; PLAN: r0=254(x), r1=27(y), r2=75(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 27
LDI r2, 75
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
