; DESCRIPTION: Composite: Places a yellow 44x97 rectangle at position (137, 137) then Places a white line segment connecting (259, 61) to (226, 33).
; PLAN: r0=137(x), r1=137(y), r2=44(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x1), r6=61(y1), r7=226(x2), r8=33(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 137
LDI r2, 44
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 61
LDI r7, 226
LDI r8, 33
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
