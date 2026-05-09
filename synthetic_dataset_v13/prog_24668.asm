; DESCRIPTION: Composite: Places a red 15x109 rectangle at position (470, 70) then Places a black line segment connecting (209, 102) to (374, 100).
; PLAN: r0=470(x), r1=70(y), r2=15(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x1), r6=102(y1), r7=374(x2), r8=100(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 470
LDI r1, 70
LDI r2, 15
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 102
LDI r7, 374
LDI r8, 100
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
