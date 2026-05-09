; DESCRIPTION: Composite: Sets a single purple pixel at (268, 11) then Draws a blue circle centered at (46, 39) with radius 21 then Renders a cyan line between points (141, 180) and (326, 31).
; PLAN: r0=268(x), r1=11(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=39(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=141(x1), r11=180(y1), r12=326(x2), r13=31(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 11
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 39
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 141
LDI r11, 180
LDI r12, 326
LDI r13, 31
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
