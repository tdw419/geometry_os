; DESCRIPTION: Composite: Places a purple 114x90 rectangle at position (344, 48) then Renders a green disk with center (323, 181) and radius 28.
; PLAN: r0=344(x), r1=48(y), r2=114(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=181(y), r7=28(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 344
LDI r1, 48
LDI r2, 114
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 181
LDI r7, 28
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
