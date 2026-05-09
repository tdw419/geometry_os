; DESCRIPTION: Renders a yellow box of size 52x15 starting at (217, 65).
; PLAN: r0=217(x), r1=65(y), r2=52(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 65
LDI r2, 52
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
