; DESCRIPTION: Composite: Creates a green rectangular region at (268, 184) spanning 11 by 27 pixels then Places a magenta line segment connecting (455, 239) to (275, 142).
; PLAN: r0=268(x), r1=184(y), r2=11(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x1), r6=239(y1), r7=275(x2), r8=142(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 184
LDI r2, 11
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 239
LDI r7, 275
LDI r8, 142
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
