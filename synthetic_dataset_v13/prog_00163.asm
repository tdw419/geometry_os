; DESCRIPTION: Composite: Renders a red disk with center (415, 166) and radius 25 then Places a cyan dot at position (348, 87) then Renders a magenta line between points (17, 69) and (371, 74).
; PLAN: r0=415(x), r1=166(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=87(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=17(x1), r11=69(y1), r12=371(x2), r13=74(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 166
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 87
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 17
LDI r11, 69
LDI r12, 371
LDI r13, 74
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
