; DESCRIPTION: Composite: Creates a black rectangular region at (387, 43) spanning 99 by 98 pixels then Places a red dot at position (260, 6) then Places a black line segment connecting (242, 239) to (108, 181).
; PLAN: r0=387(x), r1=43(y), r2=99(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=6(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=242(x1), r11=239(y1), r12=108(x2), r13=181(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 43
LDI r2, 99
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 6
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 242
LDI r11, 239
LDI r12, 108
LDI r13, 181
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
