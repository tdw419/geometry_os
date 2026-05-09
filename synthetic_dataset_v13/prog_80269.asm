; DESCRIPTION: Composite: Creates a orange circular shape at (360, 164) with radius 70 then Sets a single yellow pixel at (421, 197) then Draws a blue line from (433, 27) to (330, 97).
; PLAN: r0=360(x), r1=164(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x), r6=197(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=433(x1), r11=27(y1), r12=330(x2), r13=97(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 164
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 197
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 433
LDI r11, 27
LDI r12, 330
LDI r13, 97
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
