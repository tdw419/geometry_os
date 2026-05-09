; DESCRIPTION: Composite: Renders a yellow box of size 51x43 starting at (25, 165) then Creates a magenta circular shape at (211, 126) with radius 77 then Renders a black line between points (45, 190) and (503, 86).
; PLAN: r0=25(x), r1=165(y), r2=51(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x), r6=126(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=45(x1), r11=190(y1), r12=503(x2), r13=86(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 165
LDI r2, 51
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 126
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 45
LDI r11, 190
LDI r12, 503
LDI r13, 86
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
