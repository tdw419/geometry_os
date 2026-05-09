; DESCRIPTION: Composite: Sets a single blue pixel at (280, 104) then Places a cyan 48x58 rectangle at position (125, 140) then Places a green line segment connecting (342, 95) to (174, 192).
; PLAN: r0=280(x), r1=104(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=140(y), r7=48(width), r8=58(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=342(x1), r11=95(y1), r12=174(x2), r13=192(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 104
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 140
LDI r7, 48
LDI r8, 58
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 95
LDI r12, 174
LDI r13, 192
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
