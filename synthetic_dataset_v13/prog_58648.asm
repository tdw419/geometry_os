; DESCRIPTION: Composite: Draws a magenta line from (280, 19) to (351, 219) then Creates a cyan rectangular region at (329, 111) spanning 102 by 56 pixels.
; PLAN: r0=280(x1), r1=19(y1), r2=351(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=111(y), r7=102(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 19
LDI r2, 351
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 111
LDI r7, 102
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
