; DESCRIPTION: Composite: Places a magenta dot at position (345, 161) then Renders a magenta line between points (418, 57) and (4, 108) then Renders a blue disk with center (284, 132) and radius 65.
; PLAN: r0=345(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=418(x1), r6=57(y1), r7=4(x2), r8=108(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=284(x), r11=132(y), r12=65(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 345
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 418
LDI r6, 57
LDI r7, 4
LDI r8, 108
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 132
LDI r12, 65
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
