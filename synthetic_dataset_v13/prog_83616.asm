; DESCRIPTION: Composite: Renders a cyan line between points (150, 95) and (170, 131) then Draws a magenta circle centered at (78, 60) with radius 23 then Renders a red box of size 70x35 starting at (120, 57).
; PLAN: r0=150(x1), r1=95(y1), r2=170(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=60(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=57(y), r12=70(width), r13=35(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 95
LDI r2, 170
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 60
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 57
LDI r12, 70
LDI r13, 35
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
