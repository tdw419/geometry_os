; DESCRIPTION: Composite: Draws a green circle centered at (243, 222) with radius 24 then Places a red line segment connecting (507, 81) to (39, 241).
; PLAN: r0=243(x), r1=222(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=507(x1), r6=81(y1), r7=39(x2), r8=241(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 222
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 507
LDI r6, 81
LDI r7, 39
LDI r8, 241
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
