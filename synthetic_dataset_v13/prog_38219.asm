; DESCRIPTION: Composite: Places a white 82x97 rectangle at position (67, 63) then Draws a purple line from (453, 240) to (86, 210) then Renders a purple disk with center (130, 176) and radius 39.
; PLAN: r0=67(x), r1=63(y), r2=82(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x1), r6=240(y1), r7=86(x2), r8=210(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=130(x), r11=176(y), r12=39(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 67
LDI r1, 63
LDI r2, 82
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 240
LDI r7, 86
LDI r8, 210
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 176
LDI r12, 39
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
