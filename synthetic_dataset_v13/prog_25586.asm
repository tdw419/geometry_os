; DESCRIPTION: Composite: Places a magenta line segment connecting (36, 238) to (146, 127) then Draws a black circle centered at (391, 151) with radius 80.
; PLAN: r0=36(x1), r1=238(y1), r2=146(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=151(y), r7=80(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 36
LDI r1, 238
LDI r2, 146
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 151
LDI r7, 80
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
