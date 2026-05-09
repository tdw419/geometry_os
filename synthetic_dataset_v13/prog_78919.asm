; DESCRIPTION: Composite: Renders a white line between points (110, 204) and (497, 143) then Renders a yellow box of size 79x69 starting at (305, 8) then Sets a single black pixel at (320, 121).
; PLAN: r0=110(x1), r1=204(y1), r2=497(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=8(y), r7=79(width), r8=69(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x), r11=121(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 110
LDI r1, 204
LDI r2, 497
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 8
LDI r7, 79
LDI r8, 69
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 121
LDI r12, 0x000000
PSET r10, r11, r12
HALT
