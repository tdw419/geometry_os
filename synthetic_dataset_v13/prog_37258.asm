; DESCRIPTION: Composite: Renders a cyan line between points (127, 109) and (372, 210) then Creates a yellow circular shape at (102, 199) with radius 34 then Renders a cyan box of size 61x109 starting at (384, 2).
; PLAN: r0=127(x1), r1=109(y1), r2=372(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=199(y), r7=34(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=384(x), r11=2(y), r12=61(width), r13=109(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 109
LDI r2, 372
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 199
LDI r7, 34
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 384
LDI r11, 2
LDI r12, 61
LDI r13, 109
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
