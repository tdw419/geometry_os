; DESCRIPTION: Renders a yellow box of size 111x106 starting at (75, 132).
; PLAN: r0=75(x), r1=132(y), r2=111(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 132
LDI r2, 111
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
