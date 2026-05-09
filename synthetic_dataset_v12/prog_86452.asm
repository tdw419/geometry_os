; DESCRIPTION: Composite: Renders a white box of size 99x47 starting at (71, 123) then Renders a magenta line between points (415, 114) and (190, 157).
; PLAN: r0=71(x), r1=123(y), r2=99(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x1), r6=114(y1), r7=190(x2), r8=157(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 123
LDI r2, 99
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 114
LDI r7, 190
LDI r8, 157
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
