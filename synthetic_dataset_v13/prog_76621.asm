; DESCRIPTION: Composite: Draws a black circle centered at (43, 69) with radius 42 then Places a magenta line segment connecting (350, 225) to (228, 69) then Sets a single red pixel at (280, 114).
; PLAN: r0=43(x), r1=69(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x1), r6=225(y1), r7=228(x2), r8=69(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=114(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 43
LDI r1, 69
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 225
LDI r7, 228
LDI r8, 69
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 114
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
