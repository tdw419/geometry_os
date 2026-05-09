; DESCRIPTION: Composite: Creates a green rectangular region at (182, 66) spanning 16 by 30 pixels then Places a magenta line segment connecting (292, 117) to (497, 226) then Sets a single black pixel at (396, 213).
; PLAN: r0=182(x), r1=66(y), r2=16(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x1), r6=117(y1), r7=497(x2), r8=226(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=213(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 66
LDI r2, 16
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 117
LDI r7, 497
LDI r8, 226
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 213
LDI r12, 0x000000
PSET r10, r11, r12
HALT
