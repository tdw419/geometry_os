; DESCRIPTION: Composite: Renders a blue box of size 59x20 starting at (102, 54) then Renders a magenta line between points (365, 88) and (269, 107).
; PLAN: r0=102(x), r1=54(y), r2=59(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x1), r6=88(y1), r7=269(x2), r8=107(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 54
LDI r2, 59
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 88
LDI r7, 269
LDI r8, 107
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
