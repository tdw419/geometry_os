; DESCRIPTION: Composite: Renders a yellow disk with center (140, 138) and radius 21 then Renders a green line between points (284, 159) and (34, 56).
; PLAN: r0=140(x), r1=138(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x1), r6=159(y1), r7=34(x2), r8=56(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 138
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 159
LDI r7, 34
LDI r8, 56
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
