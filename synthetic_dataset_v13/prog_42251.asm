; DESCRIPTION: Composite: Renders a cyan line between points (154, 93) and (314, 21) then Renders a purple box of size 114x16 starting at (227, 169).
; PLAN: r0=154(x1), r1=93(y1), r2=314(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=169(y), r7=114(width), r8=16(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 93
LDI r2, 314
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 169
LDI r7, 114
LDI r8, 16
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
