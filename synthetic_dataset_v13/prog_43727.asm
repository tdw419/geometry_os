; DESCRIPTION: Composite: Creates a magenta rectangular region at (480, 50) spanning 11 by 55 pixels then Draws a blue circle centered at (168, 120) with radius 56 then Places a green line segment connecting (215, 142) to (422, 44).
; PLAN: r0=480(x), r1=50(y), r2=11(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=120(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=215(x1), r11=142(y1), r12=422(x2), r13=44(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 480
LDI r1, 50
LDI r2, 11
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 120
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 215
LDI r11, 142
LDI r12, 422
LDI r13, 44
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
