; DESCRIPTION: Composite: Places a yellow dot at position (324, 204) then Creates a cyan circular shape at (214, 135) with radius 54 then Draws a green line from (178, 158) to (222, 46).
; PLAN: r0=324(x), r1=204(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=135(y), r7=54(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=178(x1), r11=158(y1), r12=222(x2), r13=46(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 204
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 214
LDI r6, 135
LDI r7, 54
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 178
LDI r11, 158
LDI r12, 222
LDI r13, 46
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
