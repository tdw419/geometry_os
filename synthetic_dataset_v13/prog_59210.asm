; DESCRIPTION: Composite: Draws a magenta line from (40, 213) to (8, 157) then Draws a yellow circle centered at (322, 111) with radius 50.
; PLAN: r0=40(x1), r1=213(y1), r2=8(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=111(y), r7=50(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 40
LDI r1, 213
LDI r2, 8
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 111
LDI r7, 50
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
