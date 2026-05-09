; DESCRIPTION: Composite: Draws a blue rectangle at (219, 157) with width 74 and height 99 then Draws a black line from (236, 191) to (228, 45).
; PLAN: r0=219(x), r1=157(y), r2=74(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=191(y1), r7=228(x2), r8=45(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 157
LDI r2, 74
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 191
LDI r7, 228
LDI r8, 45
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
