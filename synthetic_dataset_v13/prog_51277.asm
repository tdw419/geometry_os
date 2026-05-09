; DESCRIPTION: Composite: Renders a orange line between points (425, 249) and (36, 196) then Places a yellow circle of radius 45 at center (380, 147).
; PLAN: r0=425(x1), r1=249(y1), r2=36(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=147(y), r7=45(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 425
LDI r1, 249
LDI r2, 36
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 147
LDI r7, 45
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
