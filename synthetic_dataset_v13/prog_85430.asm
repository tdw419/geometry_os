; DESCRIPTION: Composite: Renders a green line between points (338, 119) and (240, 80) then Renders a red box of size 42x52 starting at (308, 133).
; PLAN: r0=338(x1), r1=119(y1), r2=240(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=133(y), r7=42(width), r8=52(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 119
LDI r2, 240
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 133
LDI r7, 42
LDI r8, 52
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
