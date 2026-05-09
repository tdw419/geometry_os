; DESCRIPTION: Composite: Sets a single cyan pixel at (290, 111) then Creates a purple rectangular region at (19, 64) spanning 73 by 15 pixels then Places a yellow line segment connecting (462, 129) to (499, 220).
; PLAN: r0=290(x), r1=111(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=64(y), r7=73(width), r8=15(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=462(x1), r11=129(y1), r12=499(x2), r13=220(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 111
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 19
LDI r6, 64
LDI r7, 73
LDI r8, 15
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 129
LDI r12, 499
LDI r13, 220
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
