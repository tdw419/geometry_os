; DESCRIPTION: Composite: Draws a cyan line from (165, 50) to (309, 246) then Creates a red rectangular region at (334, 101) spanning 21 by 100 pixels.
; PLAN: r0=165(x1), r1=50(y1), r2=309(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=101(y), r7=21(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 50
LDI r2, 309
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 101
LDI r7, 21
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
