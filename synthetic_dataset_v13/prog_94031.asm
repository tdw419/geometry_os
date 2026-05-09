; DESCRIPTION: Composite: Draws a red rectangle at (363, 32) with width 52 and height 64 then Places a white line segment connecting (453, 8) to (474, 218) then Places a green dot at position (171, 232).
; PLAN: r0=363(x), r1=32(y), r2=52(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x1), r6=8(y1), r7=474(x2), r8=218(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=232(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 32
LDI r2, 52
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 8
LDI r7, 474
LDI r8, 218
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 232
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
