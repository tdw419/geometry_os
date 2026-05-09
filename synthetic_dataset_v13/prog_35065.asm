; DESCRIPTION: Composite: Draws a green line from (21, 75) to (344, 25) then Renders a green disk with center (211, 53) and radius 34.
; PLAN: r0=21(x1), r1=75(y1), r2=344(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=53(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 75
LDI r2, 344
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 53
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
