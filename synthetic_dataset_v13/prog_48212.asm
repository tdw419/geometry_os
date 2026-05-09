; DESCRIPTION: Composite: Renders a green line between points (170, 95) and (365, 248) then Places a black circle of radius 71 at center (417, 174) then Renders a cyan box of size 97x35 starting at (209, 30).
; PLAN: r0=170(x1), r1=95(y1), r2=365(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=174(y), r7=71(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x), r11=30(y), r12=97(width), r13=35(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 95
LDI r2, 365
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 174
LDI r7, 71
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 30
LDI r12, 97
LDI r13, 35
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
