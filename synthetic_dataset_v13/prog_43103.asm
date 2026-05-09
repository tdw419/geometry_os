; DESCRIPTION: Composite: Sets a single yellow pixel at (465, 249) then Renders a black line between points (368, 131) and (405, 156) then Renders a purple box of size 31x25 starting at (469, 51).
; PLAN: r0=465(x), r1=249(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=368(x1), r6=131(y1), r7=405(x2), r8=156(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=469(x), r11=51(y), r12=31(width), r13=25(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 249
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 368
LDI r6, 131
LDI r7, 405
LDI r8, 156
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 51
LDI r12, 31
LDI r13, 25
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
