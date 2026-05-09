; DESCRIPTION: Composite: Creates a cyan rectangular region at (352, 107) spanning 106 by 13 pixels then Draws a magenta line from (21, 211) to (287, 208).
; PLAN: r0=352(x), r1=107(y), r2=106(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x1), r6=211(y1), r7=287(x2), r8=208(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 107
LDI r2, 106
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 211
LDI r7, 287
LDI r8, 208
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
