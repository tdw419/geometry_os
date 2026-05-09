; DESCRIPTION: Composite: Creates a white rectangular region at (9, 49) spanning 46 by 93 pixels then Places a white line segment connecting (169, 83) to (426, 215) then Places a yellow dot at position (397, 228).
; PLAN: r0=9(x), r1=49(y), r2=46(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x1), r6=83(y1), r7=426(x2), r8=215(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=397(x), r11=228(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 9
LDI r1, 49
LDI r2, 46
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 83
LDI r7, 426
LDI r8, 215
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 228
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
