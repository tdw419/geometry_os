; DESCRIPTION: Composite: Draws a orange circle centered at (368, 77) with radius 42 then Renders a cyan line between points (447, 164) and (195, 239) then Renders a yellow box of size 83x93 starting at (180, 98).
; PLAN: r0=368(x), r1=77(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x1), r6=164(y1), r7=195(x2), r8=239(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=180(x), r11=98(y), r12=83(width), r13=93(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 77
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 164
LDI r7, 195
LDI r8, 239
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 98
LDI r12, 83
LDI r13, 93
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
