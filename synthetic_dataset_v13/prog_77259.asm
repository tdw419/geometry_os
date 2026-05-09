; DESCRIPTION: Composite: Renders a green line between points (450, 233) and (28, 201) then Creates a red circular shape at (284, 86) with radius 72 then Renders a purple box of size 28x77 starting at (284, 162).
; PLAN: r0=450(x1), r1=233(y1), r2=28(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=86(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=162(y), r12=28(width), r13=77(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 233
LDI r2, 28
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 86
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 162
LDI r12, 28
LDI r13, 77
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
