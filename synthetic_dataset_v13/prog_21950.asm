; DESCRIPTION: Composite: Draws a blue line from (73, 151) to (131, 207) then Draws a blue circle centered at (70, 27) with radius 23.
; PLAN: r0=73(x1), r1=151(y1), r2=131(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=27(y), r7=23(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 73
LDI r1, 151
LDI r2, 131
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 27
LDI r7, 23
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
