; DESCRIPTION: Composite: Sets a single green pixel at (320, 188) then Places a black 63x71 rectangle at position (184, 152) then Draws a cyan line from (142, 111) to (223, 105).
; PLAN: r0=320(x), r1=188(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=152(y), r7=63(width), r8=71(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=142(x1), r11=111(y1), r12=223(x2), r13=105(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 188
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 184
LDI r6, 152
LDI r7, 63
LDI r8, 71
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 111
LDI r12, 223
LDI r13, 105
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
