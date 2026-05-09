; DESCRIPTION: Composite: Draws a green line from (166, 253) to (60, 135) then Creates a white rectangular region at (72, 27) spanning 62 by 85 pixels.
; PLAN: r0=166(x1), r1=253(y1), r2=60(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=27(y), r7=62(width), r8=85(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 253
LDI r2, 60
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 27
LDI r7, 62
LDI r8, 85
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
