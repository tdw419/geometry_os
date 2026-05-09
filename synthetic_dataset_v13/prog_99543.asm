; DESCRIPTION: Composite: Places a yellow circle of radius 28 at center (473, 177) then Renders a yellow line between points (208, 121) and (485, 15).
; PLAN: r0=473(x), r1=177(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x1), r6=121(y1), r7=485(x2), r8=15(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 177
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 121
LDI r7, 485
LDI r8, 15
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
