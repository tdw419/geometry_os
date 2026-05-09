; DESCRIPTION: Composite: Places a cyan line segment connecting (255, 10) to (390, 145) then Renders a purple box of size 119x16 starting at (237, 4) then Sets a single white pixel at (464, 53).
; PLAN: r0=255(x1), r1=10(y1), r2=390(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=4(y), r7=119(width), r8=16(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=464(x), r11=53(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 10
LDI r2, 390
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 4
LDI r7, 119
LDI r8, 16
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 53
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
