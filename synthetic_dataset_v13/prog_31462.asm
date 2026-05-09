; DESCRIPTION: Composite: Renders a green box of size 84x43 starting at (108, 120) then Places a magenta dot at position (424, 183) then Renders a magenta line between points (168, 206) and (478, 168).
; PLAN: r0=108(x), r1=120(y), r2=84(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=183(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=168(x1), r11=206(y1), r12=478(x2), r13=168(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 120
LDI r2, 84
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 183
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 168
LDI r11, 206
LDI r12, 478
LDI r13, 168
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
