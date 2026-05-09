; DESCRIPTION: Composite: Creates a cyan rectangular region at (49, 150) spanning 53 by 26 pixels then Renders a blue line between points (198, 167) and (122, 164).
; PLAN: r0=49(x), r1=150(y), r2=53(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x1), r6=167(y1), r7=122(x2), r8=164(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 150
LDI r2, 53
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 167
LDI r7, 122
LDI r8, 164
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
