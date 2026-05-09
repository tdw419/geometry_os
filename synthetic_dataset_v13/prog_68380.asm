; DESCRIPTION: Composite: Renders a orange box of size 50x117 starting at (292, 129) then Draws a red line from (110, 0) to (331, 60).
; PLAN: r0=292(x), r1=129(y), r2=50(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=110(x1), r6=0(y1), r7=331(x2), r8=60(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 129
LDI r2, 50
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 0
LDI r7, 331
LDI r8, 60
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
