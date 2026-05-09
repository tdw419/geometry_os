; DESCRIPTION: Composite: Draws a green line from (398, 220) to (414, 1) then Sets a single black pixel at (172, 21) then Renders a cyan box of size 98x48 starting at (146, 137).
; PLAN: r0=398(x1), r1=220(y1), r2=414(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=21(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=146(x), r11=137(y), r12=98(width), r13=48(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 220
LDI r2, 414
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 21
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 146
LDI r11, 137
LDI r12, 98
LDI r13, 48
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
