; DESCRIPTION: Composite: Creates a white rectangular region at (315, 95) spanning 54 by 30 pixels then Renders a white line between points (453, 32) and (77, 244) then Places a blue dot at position (255, 55).
; PLAN: r0=315(x), r1=95(y), r2=54(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x1), r6=32(y1), r7=77(x2), r8=244(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=55(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 315
LDI r1, 95
LDI r2, 54
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 32
LDI r7, 77
LDI r8, 244
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 55
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
