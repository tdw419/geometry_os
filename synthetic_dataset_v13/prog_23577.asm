; DESCRIPTION: Composite: Renders a magenta box of size 47x104 starting at (32, 70) then Places a green dot at position (198, 224) then Renders a green line between points (459, 162) and (487, 131).
; PLAN: r0=32(x), r1=70(y), r2=47(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=224(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=459(x1), r11=162(y1), r12=487(x2), r13=131(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 70
LDI r2, 47
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 224
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 459
LDI r11, 162
LDI r12, 487
LDI r13, 131
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
