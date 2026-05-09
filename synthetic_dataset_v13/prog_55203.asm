; DESCRIPTION: Composite: Renders a red box of size 42x94 starting at (109, 55) then Renders a magenta line between points (389, 149) and (478, 111).
; PLAN: r0=109(x), r1=55(y), r2=42(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x1), r6=149(y1), r7=478(x2), r8=111(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 55
LDI r2, 42
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 149
LDI r7, 478
LDI r8, 111
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
