; DESCRIPTION: Composite: Places a green dot at position (175, 176) then Places a cyan circle of radius 15 at center (61, 38) then Places a cyan line segment connecting (194, 184) to (302, 113).
; PLAN: r0=175(x), r1=176(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=61(x), r6=38(y), r7=15(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x1), r11=184(y1), r12=302(x2), r13=113(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 175
LDI r1, 176
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 61
LDI r6, 38
LDI r7, 15
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 184
LDI r12, 302
LDI r13, 113
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
