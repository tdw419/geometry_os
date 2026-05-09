; DESCRIPTION: Composite: Places a black dot at position (445, 201) then Renders a red box of size 104x75 starting at (15, 108) then Places a magenta line segment connecting (497, 200) to (230, 20).
; PLAN: r0=445(x), r1=201(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=15(x), r6=108(y), r7=104(width), r8=75(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x1), r11=200(y1), r12=230(x2), r13=20(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 201
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 15
LDI r6, 108
LDI r7, 104
LDI r8, 75
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 200
LDI r12, 230
LDI r13, 20
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
