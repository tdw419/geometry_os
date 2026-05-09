; DESCRIPTION: Composite: Draws a orange line from (133, 64) to (240, 41) then Places a cyan circle of radius 11 at center (320, 175).
; PLAN: r0=133(x1), r1=64(y1), r2=240(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=175(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 64
LDI r2, 240
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 175
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
