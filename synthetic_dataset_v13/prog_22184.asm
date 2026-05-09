; DESCRIPTION: Composite: Renders a black box of size 40x116 starting at (403, 0) then Renders a yellow line between points (44, 191) and (370, 228) then Creates a red circular shape at (157, 195) with radius 18.
; PLAN: r0=403(x), r1=0(y), r2=40(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x1), r6=191(y1), r7=370(x2), r8=228(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=195(y), r12=18(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 0
LDI r2, 40
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 191
LDI r7, 370
LDI r8, 228
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 195
LDI r12, 18
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
