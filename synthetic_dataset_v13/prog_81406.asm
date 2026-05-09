; DESCRIPTION: Composite: Renders a green disk with center (371, 90) and radius 39 then Draws a white line from (453, 191) to (60, 233) then Places a green 59x21 rectangle at position (405, 216).
; PLAN: r0=371(x), r1=90(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x1), r6=191(y1), r7=60(x2), r8=233(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=216(y), r12=59(width), r13=21(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 90
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 191
LDI r7, 60
LDI r8, 233
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 216
LDI r12, 59
LDI r13, 21
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
