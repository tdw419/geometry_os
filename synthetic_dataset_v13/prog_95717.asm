; DESCRIPTION: Composite: Places a green 88x34 rectangle at position (337, 20) then Renders a purple line between points (125, 227) and (354, 63).
; PLAN: r0=337(x), r1=20(y), r2=88(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x1), r6=227(y1), r7=354(x2), r8=63(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 20
LDI r2, 88
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 227
LDI r7, 354
LDI r8, 63
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
