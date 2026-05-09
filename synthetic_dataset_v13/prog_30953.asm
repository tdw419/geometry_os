; DESCRIPTION: Composite: Renders a yellow line between points (299, 222) and (256, 38) then Renders a red box of size 86x11 starting at (375, 1).
; PLAN: r0=299(x1), r1=222(y1), r2=256(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=1(y), r7=86(width), r8=11(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 222
LDI r2, 256
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 1
LDI r7, 86
LDI r8, 11
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
