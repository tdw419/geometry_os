; DESCRIPTION: Composite: Creates a yellow rectangular region at (77, 30) spanning 95 by 112 pixels then Places a green line segment connecting (122, 168) to (384, 6) then Places a black dot at position (86, 61).
; PLAN: r0=77(x), r1=30(y), r2=95(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x1), r6=168(y1), r7=384(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=86(x), r11=61(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 77
LDI r1, 30
LDI r2, 95
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 168
LDI r7, 384
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 61
LDI r12, 0x000000
PSET r10, r11, r12
HALT
