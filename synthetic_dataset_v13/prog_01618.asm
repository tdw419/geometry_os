; DESCRIPTION: Composite: Places a yellow line segment connecting (182, 155) to (356, 209) then Places a white 91x104 rectangle at position (244, 151).
; PLAN: r0=182(x1), r1=155(y1), r2=356(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=151(y), r7=91(width), r8=104(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 155
LDI r2, 356
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 151
LDI r7, 91
LDI r8, 104
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
