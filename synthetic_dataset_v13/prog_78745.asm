; DESCRIPTION: Composite: Places a cyan 115x52 rectangle at position (395, 161) then Renders a yellow line between points (274, 122) and (348, 12).
; PLAN: r0=395(x), r1=161(y), r2=115(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x1), r6=122(y1), r7=348(x2), r8=12(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 161
LDI r2, 115
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 122
LDI r7, 348
LDI r8, 12
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
