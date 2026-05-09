; DESCRIPTION: Composite: Renders a cyan box of size 72x65 starting at (235, 76) then Sets a single yellow pixel at (442, 131) then Places a black line segment connecting (162, 125) to (174, 242).
; PLAN: r0=235(x), r1=76(y), r2=72(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=131(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=162(x1), r11=125(y1), r12=174(x2), r13=242(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 76
LDI r2, 72
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 131
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 162
LDI r11, 125
LDI r12, 174
LDI r13, 242
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
