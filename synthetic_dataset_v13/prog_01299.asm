; DESCRIPTION: Composite: Renders a orange line between points (262, 114) and (356, 2) then Draws a blue rectangle at (275, 130) with width 95 and height 97.
; PLAN: r0=262(x1), r1=114(y1), r2=356(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=130(y), r7=95(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 114
LDI r2, 356
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 130
LDI r7, 95
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
