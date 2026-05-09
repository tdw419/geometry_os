; DESCRIPTION: Composite: Places a blue line segment connecting (301, 224) to (485, 152) then Sets a single black pixel at (206, 32).
; PLAN: r0=301(x1), r1=224(y1), r2=485(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=32(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 224
LDI r2, 485
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 32
LDI r7, 0x000000
PSET r5, r6, r7
HALT
