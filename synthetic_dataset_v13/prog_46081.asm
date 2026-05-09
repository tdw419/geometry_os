; DESCRIPTION: Composite: Places a purple line segment connecting (52, 23) to (197, 146) then Renders a blue box of size 19x32 starting at (8, 99).
; PLAN: r0=52(x1), r1=23(y1), r2=197(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=8(x), r6=99(y), r7=19(width), r8=32(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 23
LDI r2, 197
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 8
LDI r6, 99
LDI r7, 19
LDI r8, 32
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
