; DESCRIPTION: Composite: Places a blue line segment connecting (28, 81) to (194, 18) then Renders a white box of size 88x38 starting at (320, 45) then Places a cyan dot at position (428, 59).
; PLAN: r0=28(x1), r1=81(y1), r2=194(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=45(y), r7=88(width), r8=38(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x), r11=59(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 28
LDI r1, 81
LDI r2, 194
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 45
LDI r7, 88
LDI r8, 38
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 59
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
