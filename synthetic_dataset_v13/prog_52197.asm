; DESCRIPTION: Composite: Renders a orange box of size 32x33 starting at (433, 42) then Draws a green line from (306, 244) to (293, 117) then Renders a black disk with center (139, 79) and radius 31.
; PLAN: r0=433(x), r1=42(y), r2=32(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x1), r6=244(y1), r7=293(x2), r8=117(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=79(y), r12=31(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 433
LDI r1, 42
LDI r2, 32
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 244
LDI r7, 293
LDI r8, 117
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 79
LDI r12, 31
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
