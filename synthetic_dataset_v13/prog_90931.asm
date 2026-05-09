; DESCRIPTION: Composite: Draws a cyan line from (3, 26) to (43, 2) then Renders a white disk with center (208, 181) and radius 35.
; PLAN: r0=3(x1), r1=26(y1), r2=43(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=181(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 26
LDI r2, 43
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 181
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
