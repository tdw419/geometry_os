; DESCRIPTION: Composite: Places a purple line segment connecting (171, 87) to (300, 140) then Places a cyan dot at position (192, 13) then Places a red 73x41 rectangle at position (332, 201).
; PLAN: r0=171(x1), r1=87(y1), r2=300(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=13(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=332(x), r11=201(y), r12=73(width), r13=41(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 87
LDI r2, 300
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 13
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 332
LDI r11, 201
LDI r12, 73
LDI r13, 41
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
