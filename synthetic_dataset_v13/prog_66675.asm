; DESCRIPTION: Composite: Draws a blue line from (426, 63) to (221, 132) then Renders a yellow box of size 82x88 starting at (172, 132).
; PLAN: r0=426(x1), r1=63(y1), r2=221(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=132(y), r7=82(width), r8=88(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 63
LDI r2, 221
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 132
LDI r7, 82
LDI r8, 88
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
