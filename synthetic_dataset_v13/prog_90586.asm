; DESCRIPTION: Composite: Renders a white box of size 21x35 starting at (370, 3) then Draws a yellow line from (234, 163) to (275, 32).
; PLAN: r0=370(x), r1=3(y), r2=21(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x1), r6=163(y1), r7=275(x2), r8=32(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 3
LDI r2, 21
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 163
LDI r7, 275
LDI r8, 32
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
