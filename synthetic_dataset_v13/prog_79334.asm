; DESCRIPTION: Composite: Places a green line segment connecting (379, 138) to (251, 221) then Renders a red box of size 33x90 starting at (119, 119).
; PLAN: r0=379(x1), r1=138(y1), r2=251(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=119(y), r7=33(width), r8=90(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 138
LDI r2, 251
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 119
LDI r7, 33
LDI r8, 90
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
