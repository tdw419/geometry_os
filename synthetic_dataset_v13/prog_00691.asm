; DESCRIPTION: Composite: Sets a single purple pixel at (61, 65) then Renders a red box of size 119x64 starting at (252, 173) then Renders a black line between points (501, 205) and (278, 208).
; PLAN: r0=61(x), r1=65(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=173(y), r7=119(width), r8=64(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=501(x1), r11=205(y1), r12=278(x2), r13=208(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 65
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 173
LDI r7, 119
LDI r8, 64
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 501
LDI r11, 205
LDI r12, 278
LDI r13, 208
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
