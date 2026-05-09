; DESCRIPTION: Composite: Draws a black line from (454, 230) to (254, 112) then Sets a single cyan pixel at (160, 187) then Renders a cyan box of size 92x51 starting at (368, 201).
; PLAN: r0=454(x1), r1=230(y1), r2=254(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=187(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=368(x), r11=201(y), r12=92(width), r13=51(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 230
LDI r2, 254
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 187
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 368
LDI r11, 201
LDI r12, 92
LDI r13, 51
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
