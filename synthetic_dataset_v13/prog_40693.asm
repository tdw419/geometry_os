; DESCRIPTION: Composite: Renders a green box of size 82x39 starting at (292, 188) then Draws a orange line from (95, 213) to (432, 209).
; PLAN: r0=292(x), r1=188(y), r2=82(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x1), r6=213(y1), r7=432(x2), r8=209(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 188
LDI r2, 82
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 213
LDI r7, 432
LDI r8, 209
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
