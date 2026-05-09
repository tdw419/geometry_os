; DESCRIPTION: Composite: Draws a magenta rectangle at (238, 154) with width 53 and height 72 then Sets a single yellow pixel at (59, 190) then Places a green line segment connecting (170, 66) to (382, 165).
; PLAN: r0=238(x), r1=154(y), r2=53(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=190(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=170(x1), r11=66(y1), r12=382(x2), r13=165(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 238
LDI r1, 154
LDI r2, 53
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 190
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 170
LDI r11, 66
LDI r12, 382
LDI r13, 165
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
