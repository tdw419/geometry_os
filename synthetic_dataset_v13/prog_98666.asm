; DESCRIPTION: Composite: Places a magenta circle of radius 13 at center (398, 152) then Places a cyan dot at position (51, 115) then Renders a yellow line between points (313, 44) and (84, 98).
; PLAN: r0=398(x), r1=152(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x), r6=115(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=313(x1), r11=44(y1), r12=84(x2), r13=98(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 152
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 115
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 313
LDI r11, 44
LDI r12, 84
LDI r13, 98
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
