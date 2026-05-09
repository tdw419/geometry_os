; DESCRIPTION: Composite: Sets a single green pixel at (277, 104) then Renders a purple box of size 49x104 starting at (286, 85) then Places a blue line segment connecting (300, 48) to (445, 59).
; PLAN: r0=277(x), r1=104(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=286(x), r6=85(y), r7=49(width), r8=104(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=300(x1), r11=48(y1), r12=445(x2), r13=59(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 104
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 286
LDI r6, 85
LDI r7, 49
LDI r8, 104
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 48
LDI r12, 445
LDI r13, 59
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
