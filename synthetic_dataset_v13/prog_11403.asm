; DESCRIPTION: Composite: Draws a red circle centered at (198, 73) with radius 66 then Draws a blue line from (334, 117) to (345, 186).
; PLAN: r0=198(x), r1=73(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x1), r6=117(y1), r7=345(x2), r8=186(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 73
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 117
LDI r7, 345
LDI r8, 186
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
