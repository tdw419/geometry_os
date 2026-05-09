; DESCRIPTION: Composite: Renders a black box of size 91x77 starting at (51, 27) then Sets a single purple pixel at (464, 66) then Places a orange line segment connecting (132, 251) to (293, 30).
; PLAN: r0=51(x), r1=27(y), r2=91(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x), r6=66(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=132(x1), r11=251(y1), r12=293(x2), r13=30(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 27
LDI r2, 91
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 66
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 132
LDI r11, 251
LDI r12, 293
LDI r13, 30
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
