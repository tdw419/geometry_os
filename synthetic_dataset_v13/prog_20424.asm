; DESCRIPTION: Composite: Draws a black line from (1, 200) to (168, 31) then Draws a magenta rectangle at (286, 167) with width 102 and height 77.
; PLAN: r0=1(x1), r1=200(y1), r2=168(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=167(y), r7=102(width), r8=77(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 200
LDI r2, 168
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 167
LDI r7, 102
LDI r8, 77
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
