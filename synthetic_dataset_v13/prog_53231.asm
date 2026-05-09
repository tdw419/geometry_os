; DESCRIPTION: Composite: Draws a purple line from (321, 213) to (168, 51) then Renders a magenta disk with center (90, 178) and radius 63.
; PLAN: r0=321(x1), r1=213(y1), r2=168(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=178(y), r7=63(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 213
LDI r2, 168
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 178
LDI r7, 63
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
