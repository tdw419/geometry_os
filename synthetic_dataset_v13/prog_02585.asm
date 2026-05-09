; DESCRIPTION: Composite: Renders a green box of size 119x62 starting at (372, 34) then Renders a red line between points (137, 33) and (336, 237).
; PLAN: r0=372(x), r1=34(y), r2=119(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x1), r6=33(y1), r7=336(x2), r8=237(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 34
LDI r2, 119
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 33
LDI r7, 336
LDI r8, 237
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
