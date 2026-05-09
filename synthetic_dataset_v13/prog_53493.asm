; DESCRIPTION: Places a black line segment connecting (340, 215) to (497, 175).
; PLAN: r0=340(x1), r1=215(y1), r2=497(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 215
LDI r2, 497
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
