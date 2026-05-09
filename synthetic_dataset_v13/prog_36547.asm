; DESCRIPTION: Composite: Places a orange dot at position (170, 202) then Renders a purple disk with center (386, 83) and radius 24 then Draws a black line from (284, 24) to (172, 233).
; PLAN: r0=170(x), r1=202(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=83(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x1), r11=24(y1), r12=172(x2), r13=233(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 202
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 386
LDI r6, 83
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 24
LDI r12, 172
LDI r13, 233
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
