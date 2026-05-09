; DESCRIPTION: Composite: Renders a cyan disk with center (323, 164) and radius 75 then Renders a black line between points (0, 101) and (361, 242).
; PLAN: r0=323(x), r1=164(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x1), r6=101(y1), r7=361(x2), r8=242(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 164
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 101
LDI r7, 361
LDI r8, 242
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
