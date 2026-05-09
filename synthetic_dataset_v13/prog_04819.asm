; DESCRIPTION: Composite: Renders a magenta box of size 22x72 starting at (127, 54) then Sets a single magenta pixel at (446, 197) then Renders a green line between points (47, 90) and (436, 8).
; PLAN: r0=127(x), r1=54(y), r2=22(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=197(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=47(x1), r11=90(y1), r12=436(x2), r13=8(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 54
LDI r2, 22
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 197
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 47
LDI r11, 90
LDI r12, 436
LDI r13, 8
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
