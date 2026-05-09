; DESCRIPTION: Composite: Places a red 27x78 rectangle at position (160, 105) then Renders a green line between points (119, 139) and (95, 255).
; PLAN: r0=160(x), r1=105(y), r2=27(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x1), r6=139(y1), r7=95(x2), r8=255(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 105
LDI r2, 27
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 139
LDI r7, 95
LDI r8, 255
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
