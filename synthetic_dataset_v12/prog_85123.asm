; DESCRIPTION: Composite: Renders a purple box of size 70x68 starting at (4, 150) then Renders a black line between points (304, 82) and (176, 3).
; PLAN: r0=4(x), r1=150(y), r2=70(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x1), r6=82(y1), r7=176(x2), r8=3(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 150
LDI r2, 70
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 82
LDI r7, 176
LDI r8, 3
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
