; DESCRIPTION: Composite: Creates a orange circular shape at (360, 151) with radius 50 then Sets a single cyan pixel at (267, 6) then Places a purple line segment connecting (358, 117) to (81, 198).
; PLAN: r0=360(x), r1=151(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=6(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=358(x1), r11=117(y1), r12=81(x2), r13=198(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 151
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 6
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 358
LDI r11, 117
LDI r12, 81
LDI r13, 198
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
