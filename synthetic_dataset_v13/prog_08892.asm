; DESCRIPTION: Composite: Creates a cyan circular shape at (359, 149) with radius 63 then Renders a red box of size 99x41 starting at (256, 74) then Places a cyan line segment connecting (192, 131) to (365, 110).
; PLAN: r0=359(x), r1=149(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=74(y), r7=99(width), r8=41(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x1), r11=131(y1), r12=365(x2), r13=110(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 149
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 74
LDI r7, 99
LDI r8, 41
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 131
LDI r12, 365
LDI r13, 110
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
