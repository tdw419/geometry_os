; DESCRIPTION: Composite: Sets a single red pixel at (243, 34) then Renders a yellow box of size 32x116 starting at (428, 89) then Places a yellow circle of radius 59 at center (219, 152).
; PLAN: r0=243(x), r1=34(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=89(y), r7=32(width), r8=116(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x), r11=152(y), r12=59(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 243
LDI r1, 34
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 428
LDI r6, 89
LDI r7, 32
LDI r8, 116
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 152
LDI r12, 59
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
