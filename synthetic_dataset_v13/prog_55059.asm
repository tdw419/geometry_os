; DESCRIPTION: Composite: Places a black line segment connecting (412, 214) to (50, 50) then Sets a single cyan pixel at (223, 192) then Renders a black box of size 33x19 starting at (373, 224).
; PLAN: r0=412(x1), r1=214(y1), r2=50(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=192(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=373(x), r11=224(y), r12=33(width), r13=19(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 214
LDI r2, 50
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 192
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 373
LDI r11, 224
LDI r12, 33
LDI r13, 19
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
