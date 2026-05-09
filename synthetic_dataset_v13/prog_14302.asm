; DESCRIPTION: Composite: Renders a magenta line between points (95, 58) and (193, 197) then Creates a yellow circular shape at (416, 111) with radius 40.
; PLAN: r0=95(x1), r1=58(y1), r2=193(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=111(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 58
LDI r2, 193
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 111
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
