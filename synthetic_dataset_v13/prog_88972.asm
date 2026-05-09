; DESCRIPTION: Composite: Renders a black line between points (176, 163) and (198, 120) then Places a red dot at position (341, 147) then Renders a red box of size 18x19 starting at (59, 66).
; PLAN: r0=176(x1), r1=163(y1), r2=198(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=147(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=59(x), r11=66(y), r12=18(width), r13=19(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 163
LDI r2, 198
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 147
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 59
LDI r11, 66
LDI r12, 18
LDI r13, 19
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
