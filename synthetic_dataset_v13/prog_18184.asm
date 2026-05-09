; DESCRIPTION: Composite: Places a magenta 10x97 rectangle at position (473, 150) then Places a black line segment connecting (352, 80) to (403, 170).
; PLAN: r0=473(x), r1=150(y), r2=10(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x1), r6=80(y1), r7=403(x2), r8=170(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 150
LDI r2, 10
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 80
LDI r7, 403
LDI r8, 170
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
