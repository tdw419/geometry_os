; DESCRIPTION: Composite: Renders a red line between points (106, 242) and (326, 247) then Renders a magenta disk with center (407, 64) and radius 61 then Places a purple 13x38 rectangle at position (360, 29).
; PLAN: r0=106(x1), r1=242(y1), r2=326(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=64(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=360(x), r11=29(y), r12=13(width), r13=38(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 242
LDI r2, 326
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 64
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 360
LDI r11, 29
LDI r12, 13
LDI r13, 38
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
