; DESCRIPTION: Renders a yellow box of size 81x90 starting at (106, 104).
; PLAN: r0=106(x), r1=104(y), r2=81(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 104
LDI r2, 81
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
