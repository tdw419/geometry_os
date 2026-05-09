; DESCRIPTION: Composite: Places a magenta line segment connecting (407, 189) to (453, 125) then Creates a cyan rectangular region at (441, 24) spanning 33 by 27 pixels.
; PLAN: r0=407(x1), r1=189(y1), r2=453(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=24(y), r7=33(width), r8=27(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 407
LDI r1, 189
LDI r2, 453
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 24
LDI r7, 33
LDI r8, 27
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
