; DESCRIPTION: Composite: Places a black 32x22 rectangle at position (65, 111) then Sets a single magenta pixel at (317, 247) then Renders a green line between points (157, 126) and (349, 181).
; PLAN: r0=65(x), r1=111(y), r2=32(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=247(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=157(x1), r11=126(y1), r12=349(x2), r13=181(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 111
LDI r2, 32
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 247
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 157
LDI r11, 126
LDI r12, 349
LDI r13, 181
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
