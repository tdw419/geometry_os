; DESCRIPTION: Composite: Sets a single blue pixel at (32, 141) then Renders a cyan disk with center (359, 126) and radius 50 then Renders a red line between points (370, 188) and (137, 125).
; PLAN: r0=32(x), r1=141(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=126(y), r7=50(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x1), r11=188(y1), r12=137(x2), r13=125(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 141
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 126
LDI r7, 50
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 188
LDI r12, 137
LDI r13, 125
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
