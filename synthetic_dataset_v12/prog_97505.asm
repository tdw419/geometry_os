; DESCRIPTION: Composite: Sets a single blue pixel at (240, 142) then Places a cyan circle of radius 77 at center (221, 117) then Renders a white line between points (21, 95) and (277, 1).
; PLAN: r0=240(x), r1=142(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=117(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=21(x1), r11=95(y1), r12=277(x2), r13=1(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 142
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 221
LDI r6, 117
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 21
LDI r11, 95
LDI r12, 277
LDI r13, 1
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
