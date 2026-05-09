; DESCRIPTION: Composite: Sets a single orange pixel at (168, 231) then Draws a red circle centered at (367, 187) with radius 59 then Places a blue line segment connecting (66, 229) to (240, 200).
; PLAN: r0=168(x), r1=231(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=187(y), r7=59(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=66(x1), r11=229(y1), r12=240(x2), r13=200(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 231
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 367
LDI r6, 187
LDI r7, 59
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 66
LDI r11, 229
LDI r12, 240
LDI r13, 200
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
