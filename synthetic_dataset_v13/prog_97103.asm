; DESCRIPTION: Composite: Places a cyan 12x67 rectangle at position (280, 16) then Places a blue line segment connecting (274, 77) to (506, 175) then Places a blue dot at position (265, 78).
; PLAN: r0=280(x), r1=16(y), r2=12(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x1), r6=77(y1), r7=506(x2), r8=175(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=78(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 280
LDI r1, 16
LDI r2, 12
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 77
LDI r7, 506
LDI r8, 175
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 78
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
