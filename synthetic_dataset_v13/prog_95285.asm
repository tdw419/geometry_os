; DESCRIPTION: Composite: Draws a white rectangle at (166, 129) with width 65 and height 91 then Draws a orange line from (370, 61) to (437, 58).
; PLAN: r0=166(x), r1=129(y), r2=65(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x1), r6=61(y1), r7=437(x2), r8=58(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 129
LDI r2, 65
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 61
LDI r7, 437
LDI r8, 58
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
