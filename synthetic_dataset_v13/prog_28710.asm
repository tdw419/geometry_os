; DESCRIPTION: Composite: Sets a single purple pixel at (198, 209) then Places a yellow 17x36 rectangle at position (392, 52) then Renders a orange line between points (446, 222) and (160, 148).
; PLAN: r0=198(x), r1=209(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=52(y), r7=17(width), r8=36(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=446(x1), r11=222(y1), r12=160(x2), r13=148(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 209
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 392
LDI r6, 52
LDI r7, 17
LDI r8, 36
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 222
LDI r12, 160
LDI r13, 148
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
