; DESCRIPTION: Composite: Places a black line segment connecting (236, 66) to (493, 184) then Creates a white rectangular region at (5, 134) spanning 63 by 99 pixels.
; PLAN: r0=236(x1), r1=66(y1), r2=493(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=134(y), r7=63(width), r8=99(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 66
LDI r2, 493
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 134
LDI r7, 63
LDI r8, 99
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
