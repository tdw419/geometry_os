; DESCRIPTION: Composite: Draws a cyan line from (161, 141) to (256, 1) then Places a orange dot at position (254, 10) then Renders a red disk with center (87, 96) and radius 79.
; PLAN: r0=161(x1), r1=141(y1), r2=256(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=10(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=87(x), r11=96(y), r12=79(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 141
LDI r2, 256
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 10
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 87
LDI r11, 96
LDI r12, 79
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
