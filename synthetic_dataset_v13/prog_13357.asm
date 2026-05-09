; DESCRIPTION: Composite: Creates a purple rectangular region at (24, 178) spanning 67 by 70 pixels then Places a white line segment connecting (157, 130) to (193, 195).
; PLAN: r0=24(x), r1=178(y), r2=67(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x1), r6=130(y1), r7=193(x2), r8=195(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 178
LDI r2, 67
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 130
LDI r7, 193
LDI r8, 195
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
