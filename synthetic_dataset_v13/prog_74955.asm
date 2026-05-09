; DESCRIPTION: Composite: Draws a cyan line from (0, 91) to (245, 121) then Renders a blue box of size 105x82 starting at (328, 166).
; PLAN: r0=0(x1), r1=91(y1), r2=245(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=166(y), r7=105(width), r8=82(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 91
LDI r2, 245
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 166
LDI r7, 105
LDI r8, 82
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
