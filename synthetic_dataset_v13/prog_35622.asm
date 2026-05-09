; DESCRIPTION: Composite: Renders a black box of size 68x71 starting at (254, 54) then Places a green line segment connecting (409, 123) to (387, 197) then Places a white dot at position (503, 158).
; PLAN: r0=254(x), r1=54(y), r2=68(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x1), r6=123(y1), r7=387(x2), r8=197(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=503(x), r11=158(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 254
LDI r1, 54
LDI r2, 68
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 123
LDI r7, 387
LDI r8, 197
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 158
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
