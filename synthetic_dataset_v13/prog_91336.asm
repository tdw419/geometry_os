; DESCRIPTION: Composite: Places a purple line segment connecting (459, 193) to (298, 201) then Places a orange dot at position (243, 250) then Renders a cyan box of size 24x96 starting at (227, 72).
; PLAN: r0=459(x1), r1=193(y1), r2=298(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=250(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=227(x), r11=72(y), r12=24(width), r13=96(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 193
LDI r2, 298
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 250
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 227
LDI r11, 72
LDI r12, 24
LDI r13, 96
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
