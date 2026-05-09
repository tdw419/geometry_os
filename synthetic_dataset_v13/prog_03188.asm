; DESCRIPTION: Composite: Renders a red line between points (279, 21) and (367, 96) then Renders a green disk with center (229, 103) and radius 17.
; PLAN: r0=279(x1), r1=21(y1), r2=367(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=103(y), r7=17(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 21
LDI r2, 367
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 103
LDI r7, 17
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
