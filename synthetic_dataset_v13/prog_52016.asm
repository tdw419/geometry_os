; DESCRIPTION: Composite: Places a yellow 101x27 rectangle at position (409, 84) then Renders a orange line between points (170, 192) and (129, 98).
; PLAN: r0=409(x), r1=84(y), r2=101(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x1), r6=192(y1), r7=129(x2), r8=98(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 84
LDI r2, 101
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 192
LDI r7, 129
LDI r8, 98
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
