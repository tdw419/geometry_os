; DESCRIPTION: Composite: Draws a white line from (374, 130) to (54, 191) then Renders a blue box of size 86x79 starting at (126, 24).
; PLAN: r0=374(x1), r1=130(y1), r2=54(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=24(y), r7=86(width), r8=79(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 130
LDI r2, 54
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 24
LDI r7, 86
LDI r8, 79
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
