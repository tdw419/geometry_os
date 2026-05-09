; DESCRIPTION: Composite: Places a blue dot at position (465, 39) then Creates a purple circular shape at (428, 20) with radius 20 then Draws a cyan rectangle at (123, 217) with width 109 and height 14.
; PLAN: r0=465(x), r1=39(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=20(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x), r11=217(y), r12=109(width), r13=14(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 39
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 20
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 217
LDI r12, 109
LDI r13, 14
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
