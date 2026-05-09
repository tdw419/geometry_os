; DESCRIPTION: Composite: Creates a red rectangular region at (96, 136) spanning 39 by 42 pixels then Places a magenta line segment connecting (399, 31) to (16, 65) then Sets a single red pixel at (470, 166).
; PLAN: r0=96(x), r1=136(y), r2=39(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x1), r6=31(y1), r7=16(x2), r8=65(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=470(x), r11=166(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 136
LDI r2, 39
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 31
LDI r7, 16
LDI r8, 65
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 166
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
