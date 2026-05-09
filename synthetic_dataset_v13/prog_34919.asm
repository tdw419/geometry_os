; DESCRIPTION: Composite: Draws a orange rectangle at (309, 152) with width 91 and height 86 then Renders a magenta line between points (433, 73) and (202, 90).
; PLAN: r0=309(x), r1=152(y), r2=91(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x1), r6=73(y1), r7=202(x2), r8=90(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 152
LDI r2, 91
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 73
LDI r7, 202
LDI r8, 90
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
