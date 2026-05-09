; DESCRIPTION: Composite: Renders a white box of size 105x59 starting at (20, 97) then Sets a single cyan pixel at (492, 52) then Places a orange line segment connecting (401, 163) to (425, 87).
; PLAN: r0=20(x), r1=97(y), r2=105(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x), r6=52(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=401(x1), r11=163(y1), r12=425(x2), r13=87(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 97
LDI r2, 105
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 52
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 401
LDI r11, 163
LDI r12, 425
LDI r13, 87
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
