; DESCRIPTION: Composite: Renders a magenta box of size 61x66 starting at (25, 103) then Places a magenta dot at position (302, 23) then Places a blue line segment connecting (393, 8) to (422, 222).
; PLAN: r0=25(x), r1=103(y), r2=61(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=23(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=393(x1), r11=8(y1), r12=422(x2), r13=222(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 103
LDI r2, 61
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 23
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 393
LDI r11, 8
LDI r12, 422
LDI r13, 222
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
