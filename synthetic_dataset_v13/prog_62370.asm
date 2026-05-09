; DESCRIPTION: Composite: Draws a magenta circle centered at (111, 148) with radius 35 then Draws a blue line from (98, 92) to (295, 91).
; PLAN: r0=111(x), r1=148(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x1), r6=92(y1), r7=295(x2), r8=91(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 148
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 92
LDI r7, 295
LDI r8, 91
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
