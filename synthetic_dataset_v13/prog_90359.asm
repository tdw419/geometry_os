; DESCRIPTION: Composite: Places a red 96x13 rectangle at position (11, 49) then Places a yellow line segment connecting (454, 43) to (66, 91).
; PLAN: r0=11(x), r1=49(y), r2=96(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=43(y1), r7=66(x2), r8=91(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 11
LDI r1, 49
LDI r2, 96
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 43
LDI r7, 66
LDI r8, 91
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
