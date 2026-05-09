; DESCRIPTION: Composite: Places a green dot at position (296, 54) then Renders a yellow line between points (421, 83) and (160, 159).
; PLAN: r0=296(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=421(x1), r6=83(y1), r7=160(x2), r8=159(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 54
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 421
LDI r6, 83
LDI r7, 160
LDI r8, 159
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
