; DESCRIPTION: Composite: Sets a single purple pixel at (443, 207) then Renders a green box of size 53x86 starting at (427, 40) then Draws a blue line from (334, 210) to (10, 115).
; PLAN: r0=443(x), r1=207(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=40(y), r7=53(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=334(x1), r11=210(y1), r12=10(x2), r13=115(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 207
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 427
LDI r6, 40
LDI r7, 53
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 210
LDI r12, 10
LDI r13, 115
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
