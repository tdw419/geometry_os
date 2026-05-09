; DESCRIPTION: Composite: Renders a black line between points (456, 187) and (273, 14) then Renders a blue box of size 102x50 starting at (86, 204).
; PLAN: r0=456(x1), r1=187(y1), r2=273(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=204(y), r7=102(width), r8=50(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 187
LDI r2, 273
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 204
LDI r7, 102
LDI r8, 50
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
