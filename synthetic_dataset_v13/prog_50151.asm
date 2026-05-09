; DESCRIPTION: Composite: Creates a green circular shape at (209, 120) with radius 77 then Places a yellow dot at position (405, 153) then Draws a orange line from (412, 9) to (244, 248).
; PLAN: r0=209(x), r1=120(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=153(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=412(x1), r11=9(y1), r12=244(x2), r13=248(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 120
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 153
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 412
LDI r11, 9
LDI r12, 244
LDI r13, 248
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
