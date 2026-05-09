; DESCRIPTION: Composite: Draws a red line from (60, 150) to (412, 76) then Creates a white rectangular region at (2, 28) spanning 31 by 109 pixels.
; PLAN: r0=60(x1), r1=150(y1), r2=412(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=2(x), r6=28(y), r7=31(width), r8=109(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 150
LDI r2, 412
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 28
LDI r7, 31
LDI r8, 109
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
