; DESCRIPTION: Composite: Renders a yellow line between points (416, 31) and (35, 166) then Creates a blue circular shape at (401, 168) with radius 11 then Places a white 63x62 rectangle at position (193, 71).
; PLAN: r0=416(x1), r1=31(y1), r2=35(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=168(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=193(x), r11=71(y), r12=63(width), r13=62(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 31
LDI r2, 35
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 168
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 193
LDI r11, 71
LDI r12, 63
LDI r13, 62
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
