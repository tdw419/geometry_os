; DESCRIPTION: Composite: Creates a yellow circular shape at (373, 20) with radius 11 then Renders a red line between points (298, 51) and (330, 21).
; PLAN: r0=373(x), r1=20(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x1), r6=51(y1), r7=330(x2), r8=21(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 20
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 51
LDI r7, 330
LDI r8, 21
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
