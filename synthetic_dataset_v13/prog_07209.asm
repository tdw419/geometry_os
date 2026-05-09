; DESCRIPTION: Composite: Draws a cyan line from (497, 200) to (61, 29) then Places a magenta circle of radius 70 at center (360, 115) then Sets a single white pixel at (176, 240).
; PLAN: r0=497(x1), r1=200(y1), r2=61(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=115(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=176(x), r11=240(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 497
LDI r1, 200
LDI r2, 61
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 115
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 176
LDI r11, 240
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
