; DESCRIPTION: Composite: Renders a cyan line between points (164, 39) and (471, 42) then Creates a blue rectangular region at (164, 159) spanning 26 by 75 pixels then Places a cyan circle of radius 50 at center (251, 180).
; PLAN: r0=164(x1), r1=39(y1), r2=471(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=159(y), r7=26(width), r8=75(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=251(x), r11=180(y), r12=50(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 39
LDI r2, 471
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 159
LDI r7, 26
LDI r8, 75
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 180
LDI r12, 50
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
