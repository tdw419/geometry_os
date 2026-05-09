; DESCRIPTION: Composite: Renders a magenta disk with center (437, 80) and radius 22 then Renders a black box of size 70x87 starting at (440, 84).
; PLAN: r0=437(x), r1=80(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=440(x), r6=84(y), r7=70(width), r8=87(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 80
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 440
LDI r6, 84
LDI r7, 70
LDI r8, 87
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
