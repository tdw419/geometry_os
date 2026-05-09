; DESCRIPTION: Renders a yellow box of size 96x65 starting at (352, 185).
; PLAN: r0=352(x), r1=185(y), r2=96(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 185
LDI r2, 96
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
