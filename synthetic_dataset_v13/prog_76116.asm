; DESCRIPTION: Composite: Places a white 105x109 rectangle at position (130, 31) then Draws a yellow line from (374, 225) to (319, 189).
; PLAN: r0=130(x), r1=31(y), r2=105(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x1), r6=225(y1), r7=319(x2), r8=189(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 31
LDI r2, 105
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 225
LDI r7, 319
LDI r8, 189
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
