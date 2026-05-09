; DESCRIPTION: Composite: Renders a cyan box of size 79x34 starting at (405, 211) then Places a blue circle of radius 37 at center (224, 75) then Draws a blue line from (43, 214) to (330, 252).
; PLAN: r0=405(x), r1=211(y), r2=79(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x), r6=75(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=43(x1), r11=214(y1), r12=330(x2), r13=252(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 211
LDI r2, 79
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 75
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 43
LDI r11, 214
LDI r12, 330
LDI r13, 252
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
