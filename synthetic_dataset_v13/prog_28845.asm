; DESCRIPTION: Composite: Draws a red line from (261, 243) to (295, 247) then Draws a purple circle centered at (200, 50) with radius 48.
; PLAN: r0=261(x1), r1=243(y1), r2=295(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=50(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 243
LDI r2, 295
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 50
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
