; DESCRIPTION: Composite: Renders a blue box of size 57x24 starting at (403, 28) then Draws a yellow line from (101, 109) to (14, 195).
; PLAN: r0=403(x), r1=28(y), r2=57(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x1), r6=109(y1), r7=14(x2), r8=195(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 28
LDI r2, 57
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 109
LDI r7, 14
LDI r8, 195
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
