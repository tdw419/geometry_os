; DESCRIPTION: Composite: Draws a red line from (178, 83) to (329, 166) then Renders a orange box of size 32x18 starting at (264, 62).
; PLAN: r0=178(x1), r1=83(y1), r2=329(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=62(y), r7=32(width), r8=18(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 83
LDI r2, 329
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 62
LDI r7, 32
LDI r8, 18
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
