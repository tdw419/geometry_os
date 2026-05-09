; DESCRIPTION: Composite: Draws a purple rectangle at (416, 152) with width 49 and height 77 then Places a cyan dot at position (485, 37) then Renders a purple line between points (501, 130) and (190, 25).
; PLAN: r0=416(x), r1=152(y), r2=49(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x), r6=37(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=501(x1), r11=130(y1), r12=190(x2), r13=25(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 152
LDI r2, 49
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 37
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 501
LDI r11, 130
LDI r12, 190
LDI r13, 25
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
