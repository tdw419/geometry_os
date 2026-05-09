; DESCRIPTION: Composite: Renders a yellow line between points (109, 74) and (10, 222) then Renders a red box of size 39x74 starting at (73, 133).
; PLAN: r0=109(x1), r1=74(y1), r2=10(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=133(y), r7=39(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 74
LDI r2, 10
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 133
LDI r7, 39
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
