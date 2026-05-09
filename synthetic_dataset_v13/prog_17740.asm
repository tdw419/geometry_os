; DESCRIPTION: Composite: Renders a black line between points (301, 78) and (213, 227) then Places a blue dot at position (335, 69) then Places a purple 31x86 rectangle at position (281, 129).
; PLAN: r0=301(x1), r1=78(y1), r2=213(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=69(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=129(y), r12=31(width), r13=86(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 78
LDI r2, 213
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 69
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 281
LDI r11, 129
LDI r12, 31
LDI r13, 86
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
