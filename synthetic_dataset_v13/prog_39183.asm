; DESCRIPTION: Composite: Places a cyan dot at position (81, 31) then Renders a green disk with center (363, 173) and radius 16 then Places a orange line segment connecting (333, 171) to (175, 121).
; PLAN: r0=81(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=173(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=333(x1), r11=171(y1), r12=175(x2), r13=121(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 31
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 173
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 333
LDI r11, 171
LDI r12, 175
LDI r13, 121
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
