; DESCRIPTION: Composite: Renders a cyan box of size 57x113 starting at (269, 120) then Places a white line segment connecting (250, 69) to (83, 248) then Places a white dot at position (268, 2).
; PLAN: r0=269(x), r1=120(y), r2=57(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x1), r6=69(y1), r7=83(x2), r8=248(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=268(x), r11=2(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 269
LDI r1, 120
LDI r2, 57
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 69
LDI r7, 83
LDI r8, 248
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 2
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
