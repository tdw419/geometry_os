; DESCRIPTION: Composite: Places a magenta line segment connecting (261, 111) to (380, 229) then Creates a cyan rectangular region at (188, 5) spanning 43 by 98 pixels.
; PLAN: r0=261(x1), r1=111(y1), r2=380(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=5(y), r7=43(width), r8=98(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 111
LDI r2, 380
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 5
LDI r7, 43
LDI r8, 98
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
