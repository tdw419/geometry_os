; DESCRIPTION: Composite: Places a blue 105x104 rectangle at position (145, 30) then Places a orange circle of radius 32 at center (354, 35) then Renders a cyan line between points (315, 21) and (16, 166).
; PLAN: r0=145(x), r1=30(y), r2=105(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=35(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x1), r11=21(y1), r12=16(x2), r13=166(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 30
LDI r2, 105
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 35
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 21
LDI r12, 16
LDI r13, 166
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
