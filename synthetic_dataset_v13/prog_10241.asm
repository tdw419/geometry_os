; DESCRIPTION: Composite: Places a cyan line segment connecting (150, 54) to (510, 141) then Draws a cyan rectangle at (335, 47) with width 13 and height 63.
; PLAN: r0=150(x1), r1=54(y1), r2=510(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=47(y), r7=13(width), r8=63(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 54
LDI r2, 510
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 47
LDI r7, 13
LDI r8, 63
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
