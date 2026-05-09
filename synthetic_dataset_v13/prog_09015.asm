; DESCRIPTION: Composite: Renders a red box of size 48x83 starting at (3, 155) then Renders a green line between points (289, 147) and (50, 210).
; PLAN: r0=3(x), r1=155(y), r2=48(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x1), r6=147(y1), r7=50(x2), r8=210(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 155
LDI r2, 48
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 147
LDI r7, 50
LDI r8, 210
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
