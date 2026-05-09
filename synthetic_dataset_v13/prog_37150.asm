; DESCRIPTION: Composite: Renders a blue box of size 36x77 starting at (473, 64) then Renders a yellow line between points (485, 91) and (19, 46).
; PLAN: r0=473(x), r1=64(y), r2=36(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x1), r6=91(y1), r7=19(x2), r8=46(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 64
LDI r2, 36
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 91
LDI r7, 19
LDI r8, 46
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
