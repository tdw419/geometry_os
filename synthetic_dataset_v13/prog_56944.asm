; DESCRIPTION: Composite: Renders a yellow disk with center (413, 175) and radius 57 then Renders a yellow box of size 94x42 starting at (81, 125) then Places a black line segment connecting (113, 242) to (384, 75).
; PLAN: r0=413(x), r1=175(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x), r6=125(y), r7=94(width), r8=42(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=113(x1), r11=242(y1), r12=384(x2), r13=75(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 175
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 125
LDI r7, 94
LDI r8, 42
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 242
LDI r12, 384
LDI r13, 75
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
