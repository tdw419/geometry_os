; DESCRIPTION: Renders a yellow box of size 115x40 starting at (79, 191).
; PLAN: r0=79(x), r1=191(y), r2=115(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 191
LDI r2, 115
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
