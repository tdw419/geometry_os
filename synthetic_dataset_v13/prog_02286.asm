; DESCRIPTION: Composite: Draws a cyan line from (260, 243) to (312, 11) then Renders a yellow disk with center (165, 173) and radius 73.
; PLAN: r0=260(x1), r1=243(y1), r2=312(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=173(y), r7=73(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 243
LDI r2, 312
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 173
LDI r7, 73
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
