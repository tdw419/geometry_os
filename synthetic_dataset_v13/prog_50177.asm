; DESCRIPTION: Composite: Draws a orange line from (309, 60) to (306, 88) then Renders a cyan box of size 68x116 starting at (260, 36).
; PLAN: r0=309(x1), r1=60(y1), r2=306(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=36(y), r7=68(width), r8=116(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 60
LDI r2, 306
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 36
LDI r7, 68
LDI r8, 116
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
