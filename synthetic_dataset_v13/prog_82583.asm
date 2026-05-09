; DESCRIPTION: Composite: Places a magenta line segment connecting (93, 56) to (298, 188) then Draws a cyan rectangle at (34, 123) with width 59 and height 32.
; PLAN: r0=93(x1), r1=56(y1), r2=298(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=34(x), r6=123(y), r7=59(width), r8=32(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 56
LDI r2, 298
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 123
LDI r7, 59
LDI r8, 32
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
