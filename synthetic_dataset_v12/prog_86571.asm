; DESCRIPTION: Composite: Places a magenta dot at position (415, 208) then Draws a yellow line from (266, 130) to (141, 206) then Creates a cyan circular shape at (360, 84) with radius 71.
; PLAN: r0=415(x), r1=208(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=266(x1), r6=130(y1), r7=141(x2), r8=206(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=84(y), r12=71(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 415
LDI r1, 208
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 130
LDI r7, 141
LDI r8, 206
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 84
LDI r12, 71
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
