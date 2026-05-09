; DESCRIPTION: Composite: Sets a single yellow pixel at (271, 11) then Creates a green rectangular region at (333, 190) spanning 17 by 32 pixels then Places a magenta line segment connecting (49, 209) to (66, 72).
; PLAN: r0=271(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=333(x), r6=190(y), r7=17(width), r8=32(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=49(x1), r11=209(y1), r12=66(x2), r13=72(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 11
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 333
LDI r6, 190
LDI r7, 17
LDI r8, 32
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 209
LDI r12, 66
LDI r13, 72
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
