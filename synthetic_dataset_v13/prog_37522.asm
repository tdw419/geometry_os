; DESCRIPTION: Composite: Renders a red box of size 14x75 starting at (473, 127) then Renders a green line between points (67, 79) and (263, 54).
; PLAN: r0=473(x), r1=127(y), r2=14(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x1), r6=79(y1), r7=263(x2), r8=54(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 127
LDI r2, 14
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 79
LDI r7, 263
LDI r8, 54
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
