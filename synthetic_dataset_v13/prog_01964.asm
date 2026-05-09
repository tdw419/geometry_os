; DESCRIPTION: Composite: Renders a black box of size 64x31 starting at (375, 59) then Sets a single orange pixel at (275, 129) then Renders a black line between points (416, 34) and (226, 96).
; PLAN: r0=375(x), r1=59(y), r2=64(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=129(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=416(x1), r11=34(y1), r12=226(x2), r13=96(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 59
LDI r2, 64
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 129
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 416
LDI r11, 34
LDI r12, 226
LDI r13, 96
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
