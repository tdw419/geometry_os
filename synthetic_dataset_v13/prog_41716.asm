; DESCRIPTION: Composite: Renders a purple line between points (235, 244) and (455, 41) then Creates a cyan rectangular region at (315, 184) spanning 39 by 53 pixels.
; PLAN: r0=235(x1), r1=244(y1), r2=455(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=184(y), r7=39(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 244
LDI r2, 455
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 184
LDI r7, 39
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
