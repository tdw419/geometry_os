; DESCRIPTION: Composite: Creates a black rectangular region at (130, 121) spanning 83 by 84 pixels then Places a white line segment connecting (394, 22) to (48, 255).
; PLAN: r0=130(x), r1=121(y), r2=83(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x1), r6=22(y1), r7=48(x2), r8=255(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 121
LDI r2, 83
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 22
LDI r7, 48
LDI r8, 255
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
