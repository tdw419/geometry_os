; DESCRIPTION: Composite: Draws a white rectangle at (373, 25) with width 114 and height 52 then Sets a single cyan pixel at (375, 201) then Renders a white line between points (485, 63) and (374, 0).
; PLAN: r0=373(x), r1=25(y), r2=114(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x), r6=201(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=485(x1), r11=63(y1), r12=374(x2), r13=0(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 25
LDI r2, 114
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 201
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 485
LDI r11, 63
LDI r12, 374
LDI r13, 0
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
