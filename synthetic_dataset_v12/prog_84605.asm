; DESCRIPTION: Composite: Renders a cyan disk with center (434, 151) and radius 34 then Draws a black line from (227, 25) to (361, 92).
; PLAN: r0=434(x), r1=151(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x1), r6=25(y1), r7=361(x2), r8=92(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 151
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 25
LDI r7, 361
LDI r8, 92
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
