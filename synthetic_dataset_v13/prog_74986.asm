; DESCRIPTION: Composite: Places a green dot at position (469, 68) then Places a red line segment connecting (142, 49) to (502, 77) then Places a magenta circle of radius 77 at center (136, 133).
; PLAN: r0=469(x), r1=68(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=142(x1), r6=49(y1), r7=502(x2), r8=77(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=136(x), r11=133(y), r12=77(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 469
LDI r1, 68
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 142
LDI r6, 49
LDI r7, 502
LDI r8, 77
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 133
LDI r12, 77
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
