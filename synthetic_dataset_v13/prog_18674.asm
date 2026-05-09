; DESCRIPTION: Composite: Places a white line segment connecting (393, 131) to (160, 204) then Sets a single white pixel at (428, 101) then Renders a cyan box of size 90x24 starting at (407, 46).
; PLAN: r0=393(x1), r1=131(y1), r2=160(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=101(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=407(x), r11=46(y), r12=90(width), r13=24(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 131
LDI r2, 160
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 101
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 407
LDI r11, 46
LDI r12, 90
LDI r13, 24
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
