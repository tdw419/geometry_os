; DESCRIPTION: Composite: Renders a magenta box of size 27x77 starting at (224, 97) then Draws a purple circle centered at (183, 163) with radius 27 then Renders a yellow line between points (307, 203) and (465, 111).
; PLAN: r0=224(x), r1=97(y), r2=27(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=163(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x1), r11=203(y1), r12=465(x2), r13=111(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 224
LDI r1, 97
LDI r2, 27
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 163
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 203
LDI r12, 465
LDI r13, 111
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
