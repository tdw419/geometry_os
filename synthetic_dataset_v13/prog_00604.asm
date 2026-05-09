; DESCRIPTION: Composite: Renders a magenta line between points (112, 53) and (362, 26) then Creates a cyan rectangular region at (125, 9) spanning 62 by 22 pixels.
; PLAN: r0=112(x1), r1=53(y1), r2=362(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=9(y), r7=62(width), r8=22(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 53
LDI r2, 362
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 9
LDI r7, 62
LDI r8, 22
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
