; DESCRIPTION: Composite: Draws a orange rectangle at (391, 204) with width 27 and height 30 then Sets a single yellow pixel at (73, 163) then Places a white line segment connecting (168, 164) to (235, 200).
; PLAN: r0=391(x), r1=204(y), r2=27(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=163(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=168(x1), r11=164(y1), r12=235(x2), r13=200(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 204
LDI r2, 27
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 163
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 168
LDI r11, 164
LDI r12, 235
LDI r13, 200
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
