; DESCRIPTION: Composite: Draws a red line from (165, 110) to (293, 211) then Renders a orange box of size 102x53 starting at (21, 75).
; PLAN: r0=165(x1), r1=110(y1), r2=293(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=21(x), r6=75(y), r7=102(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 110
LDI r2, 293
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 75
LDI r7, 102
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
