; DESCRIPTION: Renders a yellow box of size 12x15 starting at (74, 172).
; PLAN: r0=74(x), r1=172(y), r2=12(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 172
LDI r2, 12
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
