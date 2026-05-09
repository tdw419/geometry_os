; DESCRIPTION: Composite: Places a white circle of radius 11 at center (43, 231) then Draws a white line from (52, 219) to (36, 152) then Places a cyan dot at position (355, 123).
; PLAN: r0=43(x), r1=231(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x1), r6=219(y1), r7=36(x2), r8=152(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=355(x), r11=123(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 43
LDI r1, 231
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 219
LDI r7, 36
LDI r8, 152
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 123
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
