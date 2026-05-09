; DESCRIPTION: Composite: Renders a magenta line between points (39, 43) and (85, 141) then Creates a red rectangular region at (143, 209) spanning 35 by 31 pixels.
; PLAN: r0=39(x1), r1=43(y1), r2=85(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=209(y), r7=35(width), r8=31(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 43
LDI r2, 85
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 209
LDI r7, 35
LDI r8, 31
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
