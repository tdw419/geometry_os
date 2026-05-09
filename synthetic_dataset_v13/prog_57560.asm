; DESCRIPTION: Composite: Places a magenta dot at position (8, 41) then Renders a purple line between points (508, 184) and (255, 19) then Renders a red box of size 41x120 starting at (92, 43).
; PLAN: r0=8(x), r1=41(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=508(x1), r6=184(y1), r7=255(x2), r8=19(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=92(x), r11=43(y), r12=41(width), r13=120(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 8
LDI r1, 41
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 508
LDI r6, 184
LDI r7, 255
LDI r8, 19
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 43
LDI r12, 41
LDI r13, 120
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
