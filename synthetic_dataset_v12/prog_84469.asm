; DESCRIPTION: Composite: Sets a single orange pixel at (454, 151) then Renders a yellow box of size 52x95 starting at (192, 73) then Renders a yellow line between points (221, 99) and (135, 10).
; PLAN: r0=454(x), r1=151(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=73(y), r7=52(width), r8=95(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=221(x1), r11=99(y1), r12=135(x2), r13=10(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 151
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 192
LDI r6, 73
LDI r7, 52
LDI r8, 95
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 99
LDI r12, 135
LDI r13, 10
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
