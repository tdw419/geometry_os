; DESCRIPTION: Composite: Places a green line segment connecting (503, 192) to (134, 55) then Creates a white rectangular region at (64, 26) spanning 39 by 89 pixels.
; PLAN: r0=503(x1), r1=192(y1), r2=134(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=26(y), r7=39(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 503
LDI r1, 192
LDI r2, 134
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 26
LDI r7, 39
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
