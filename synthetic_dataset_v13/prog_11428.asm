; DESCRIPTION: Composite: Places a green 91x36 rectangle at position (257, 152) then Places a blue line segment connecting (347, 218) to (468, 79).
; PLAN: r0=257(x), r1=152(y), r2=91(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x1), r6=218(y1), r7=468(x2), r8=79(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 152
LDI r2, 91
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 218
LDI r7, 468
LDI r8, 79
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
