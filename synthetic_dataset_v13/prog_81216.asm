; DESCRIPTION: Composite: Creates a cyan rectangular region at (38, 147) spanning 117 by 107 pixels then Renders a magenta line between points (98, 2) and (288, 8).
; PLAN: r0=38(x), r1=147(y), r2=117(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x1), r6=2(y1), r7=288(x2), r8=8(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 38
LDI r1, 147
LDI r2, 117
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 2
LDI r7, 288
LDI r8, 8
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
