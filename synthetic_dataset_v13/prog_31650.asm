; DESCRIPTION: Composite: Draws a orange line from (502, 240) to (275, 174) then Places a red 114x90 rectangle at position (184, 97).
; PLAN: r0=502(x1), r1=240(y1), r2=275(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=97(y), r7=114(width), r8=90(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 502
LDI r1, 240
LDI r2, 275
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 97
LDI r7, 114
LDI r8, 90
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
