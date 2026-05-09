; DESCRIPTION: Composite: Draws a purple line from (208, 34) to (313, 51) then Sets a single green pixel at (300, 205) then Renders a cyan box of size 63x100 starting at (87, 46).
; PLAN: r0=208(x1), r1=34(y1), r2=313(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=205(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=87(x), r11=46(y), r12=63(width), r13=100(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 34
LDI r2, 313
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 205
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 87
LDI r11, 46
LDI r12, 63
LDI r13, 100
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
