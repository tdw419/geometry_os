; DESCRIPTION: Composite: Draws a white circle centered at (349, 93) with radius 59 then Draws a yellow line from (188, 114) to (208, 246).
; PLAN: r0=349(x), r1=93(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x1), r6=114(y1), r7=208(x2), r8=246(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 93
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 114
LDI r7, 208
LDI r8, 246
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
