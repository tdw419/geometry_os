; DESCRIPTION: Composite: Places a white 80x55 rectangle at position (294, 105) then Sets a single green pixel at (509, 226) then Places a black line segment connecting (446, 97) to (24, 241).
; PLAN: r0=294(x), r1=105(y), r2=80(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x), r6=226(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=446(x1), r11=97(y1), r12=24(x2), r13=241(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 105
LDI r2, 80
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 226
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 446
LDI r11, 97
LDI r12, 24
LDI r13, 241
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
