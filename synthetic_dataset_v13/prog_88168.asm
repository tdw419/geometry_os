; DESCRIPTION: Composite: Draws a yellow line from (85, 25) to (42, 247) then Renders a orange box of size 13x74 starting at (188, 83).
; PLAN: r0=85(x1), r1=25(y1), r2=42(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=83(y), r7=13(width), r8=74(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 25
LDI r2, 42
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 83
LDI r7, 13
LDI r8, 74
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
