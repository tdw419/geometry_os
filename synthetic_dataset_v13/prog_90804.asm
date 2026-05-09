; DESCRIPTION: Composite: Places a magenta line segment connecting (451, 213) to (150, 37) then Creates a cyan circular shape at (340, 57) with radius 42 then Renders a blue box of size 32x20 starting at (419, 163).
; PLAN: r0=451(x1), r1=213(y1), r2=150(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=57(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x), r11=163(y), r12=32(width), r13=20(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 213
LDI r2, 150
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 57
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 163
LDI r12, 32
LDI r13, 20
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
