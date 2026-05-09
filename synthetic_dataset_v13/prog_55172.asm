; DESCRIPTION: Composite: Draws a white line from (331, 129) to (501, 122) then Draws a orange circle centered at (399, 196) with radius 60 then Places a orange dot at position (479, 229).
; PLAN: r0=331(x1), r1=129(y1), r2=501(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=196(y), r7=60(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=479(x), r11=229(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 331
LDI r1, 129
LDI r2, 501
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 196
LDI r7, 60
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 479
LDI r11, 229
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
