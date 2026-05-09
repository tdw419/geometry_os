; DESCRIPTION: Composite: Places a purple dot at position (173, 113) then Places a purple 50x100 rectangle at position (72, 108) then Renders a black line between points (170, 63) and (213, 217).
; PLAN: r0=173(x), r1=113(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=108(y), r7=50(width), r8=100(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=170(x1), r11=63(y1), r12=213(x2), r13=217(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 113
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 108
LDI r7, 50
LDI r8, 100
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 63
LDI r12, 213
LDI r13, 217
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
