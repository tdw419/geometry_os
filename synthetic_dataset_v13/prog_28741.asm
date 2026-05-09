; DESCRIPTION: Composite: Draws a white circle centered at (369, 95) with radius 54 then Draws a blue line from (41, 73) to (406, 133) then Sets a single blue pixel at (152, 42).
; PLAN: r0=369(x), r1=95(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x1), r6=73(y1), r7=406(x2), r8=133(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=42(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 369
LDI r1, 95
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 73
LDI r7, 406
LDI r8, 133
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 42
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
