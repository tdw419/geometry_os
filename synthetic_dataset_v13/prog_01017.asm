; DESCRIPTION: Composite: Draws a magenta line from (178, 145) to (393, 247) then Renders a white box of size 114x77 starting at (398, 109).
; PLAN: r0=178(x1), r1=145(y1), r2=393(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=109(y), r7=114(width), r8=77(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 145
LDI r2, 393
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 109
LDI r7, 114
LDI r8, 77
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
