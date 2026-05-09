; DESCRIPTION: Composite: Creates a yellow circular shape at (53, 146) with radius 38 then Draws a yellow line from (336, 180) to (127, 135).
; PLAN: r0=53(x), r1=146(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x1), r6=180(y1), r7=127(x2), r8=135(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 146
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 180
LDI r7, 127
LDI r8, 135
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
