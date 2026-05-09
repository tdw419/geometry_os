; DESCRIPTION: Composite: Places a yellow line segment connecting (258, 97) to (385, 37) then Places a yellow 36x109 rectangle at position (367, 49).
; PLAN: r0=258(x1), r1=97(y1), r2=385(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=49(y), r7=36(width), r8=109(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 97
LDI r2, 385
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 49
LDI r7, 36
LDI r8, 109
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
