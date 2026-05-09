; DESCRIPTION: Composite: Draws a green line from (145, 221) to (189, 45) then Renders a cyan disk with center (366, 188) and radius 11.
; PLAN: r0=145(x1), r1=221(y1), r2=189(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=366(x), r6=188(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 145
LDI r1, 221
LDI r2, 189
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 188
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
