; DESCRIPTION: Composite: Creates a orange circular shape at (365, 159) with radius 61 then Sets a single cyan pixel at (255, 232) then Places a red line segment connecting (451, 196) to (193, 236).
; PLAN: r0=365(x), r1=159(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x), r6=232(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=451(x1), r11=196(y1), r12=193(x2), r13=236(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 365
LDI r1, 159
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 232
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 451
LDI r11, 196
LDI r12, 193
LDI r13, 236
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
