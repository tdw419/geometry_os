; DESCRIPTION: Composite: Renders a red line between points (236, 215) and (335, 247) then Places a yellow circle of radius 60 at center (307, 110).
; PLAN: r0=236(x1), r1=215(y1), r2=335(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=110(y), r7=60(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 236
LDI r1, 215
LDI r2, 335
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 110
LDI r7, 60
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
