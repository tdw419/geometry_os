; DESCRIPTION: Composite: Places a purple 19x46 rectangle at position (168, 171) then Renders a red disk with center (73, 112) and radius 63 then Draws a cyan line from (62, 170) to (355, 120).
; PLAN: r0=168(x), r1=171(y), r2=19(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=112(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=62(x1), r11=170(y1), r12=355(x2), r13=120(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 171
LDI r2, 19
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 112
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 62
LDI r11, 170
LDI r12, 355
LDI r13, 120
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
