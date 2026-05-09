; DESCRIPTION: Composite: Places a cyan line segment connecting (79, 220) to (262, 190) then Draws a blue circle centered at (140, 127) with radius 64.
; PLAN: r0=79(x1), r1=220(y1), r2=262(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=127(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 79
LDI r1, 220
LDI r2, 262
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 127
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
