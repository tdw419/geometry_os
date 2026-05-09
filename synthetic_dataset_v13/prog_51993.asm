; DESCRIPTION: Composite: Renders a green disk with center (345, 101) and radius 66 then Renders a black line between points (148, 132) and (307, 76).
; PLAN: r0=345(x), r1=101(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x1), r6=132(y1), r7=307(x2), r8=76(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 101
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 132
LDI r7, 307
LDI r8, 76
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
