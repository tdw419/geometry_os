; DESCRIPTION: Composite: Renders a orange disk with center (489, 133) and radius 16 then Renders a blue line between points (156, 67) and (362, 230).
; PLAN: r0=489(x), r1=133(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x1), r6=67(y1), r7=362(x2), r8=230(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 489
LDI r1, 133
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 67
LDI r7, 362
LDI r8, 230
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
