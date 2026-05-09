; DESCRIPTION: Composite: Places a yellow dot at position (205, 116) then Draws a red circle centered at (349, 188) with radius 38 then Draws a white line from (446, 239) to (260, 220).
; PLAN: r0=205(x), r1=116(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=188(y), r7=38(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=446(x1), r11=239(y1), r12=260(x2), r13=220(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 116
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 349
LDI r6, 188
LDI r7, 38
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 446
LDI r11, 239
LDI r12, 260
LDI r13, 220
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
