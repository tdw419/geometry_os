; DESCRIPTION: Composite: Creates a purple circular shape at (382, 117) with radius 28 then Renders a green line between points (160, 25) and (125, 102).
; PLAN: r0=382(x), r1=117(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x1), r6=25(y1), r7=125(x2), r8=102(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 117
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 25
LDI r7, 125
LDI r8, 102
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
