; DESCRIPTION: Composite: Creates a purple rectangular region at (9, 2) spanning 98 by 32 pixels then Renders a magenta line between points (108, 187) and (256, 154).
; PLAN: r0=9(x), r1=2(y), r2=98(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x1), r6=187(y1), r7=256(x2), r8=154(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 9
LDI r1, 2
LDI r2, 98
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 187
LDI r7, 256
LDI r8, 154
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
