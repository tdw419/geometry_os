; DESCRIPTION: Composite: Renders a blue box of size 27x42 starting at (29, 98) then Renders a orange line between points (40, 94) and (353, 222).
; PLAN: r0=29(x), r1=98(y), r2=27(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x1), r6=94(y1), r7=353(x2), r8=222(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 98
LDI r2, 27
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 94
LDI r7, 353
LDI r8, 222
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
