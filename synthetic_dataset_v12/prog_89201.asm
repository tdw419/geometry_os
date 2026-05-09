; DESCRIPTION: Composite: Places a green line segment connecting (266, 151) to (330, 197) then Places a magenta dot at position (174, 15) then Places a blue 100x63 rectangle at position (28, 90).
; PLAN: r0=266(x1), r1=151(y1), r2=330(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=15(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=28(x), r11=90(y), r12=100(width), r13=63(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 151
LDI r2, 330
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 15
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 28
LDI r11, 90
LDI r12, 100
LDI r13, 63
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
