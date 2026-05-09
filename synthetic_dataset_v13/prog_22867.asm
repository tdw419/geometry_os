; DESCRIPTION: Composite: Places a green circle of radius 13 at center (416, 68) then Places a red dot at position (193, 186) then Places a purple 41x30 rectangle at position (112, 106).
; PLAN: r0=416(x), r1=68(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=186(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=106(y), r12=41(width), r13=30(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 68
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 186
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 112
LDI r11, 106
LDI r12, 41
LDI r13, 30
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
