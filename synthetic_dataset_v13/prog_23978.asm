; DESCRIPTION: Composite: Renders a black box of size 13x62 starting at (304, 146) then Renders a blue line between points (366, 219) and (480, 96).
; PLAN: r0=304(x), r1=146(y), r2=13(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x1), r6=219(y1), r7=480(x2), r8=96(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 146
LDI r2, 13
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 219
LDI r7, 480
LDI r8, 96
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
