; DESCRIPTION: Composite: Sets a single yellow pixel at (505, 161) then Draws a orange circle centered at (171, 98) with radius 42 then Draws a blue line from (240, 220) to (172, 204).
; PLAN: r0=505(x), r1=161(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=98(y), r7=42(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=240(x1), r11=220(y1), r12=172(x2), r13=204(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 505
LDI r1, 161
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 171
LDI r6, 98
LDI r7, 42
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 240
LDI r11, 220
LDI r12, 172
LDI r13, 204
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
