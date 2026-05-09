; DESCRIPTION: Composite: Places a blue line segment connecting (464, 115) to (87, 26) then Renders a black box of size 27x83 starting at (354, 11) then Places a white dot at position (26, 90).
; PLAN: r0=464(x1), r1=115(y1), r2=87(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=11(y), r7=27(width), r8=83(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=26(x), r11=90(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 464
LDI r1, 115
LDI r2, 87
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 11
LDI r7, 27
LDI r8, 83
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 90
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
