; DESCRIPTION: Composite: Places a blue circle of radius 22 at center (360, 209) then Renders a blue line between points (276, 244) and (23, 149) then Places a cyan dot at position (223, 239).
; PLAN: r0=360(x), r1=209(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x1), r6=244(y1), r7=23(x2), r8=149(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=239(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 360
LDI r1, 209
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 244
LDI r7, 23
LDI r8, 149
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 239
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
