; DESCRIPTION: Composite: Creates a green rectangular region at (403, 95) spanning 108 by 18 pixels then Places a white line segment connecting (266, 151) to (37, 242).
; PLAN: r0=403(x), r1=95(y), r2=108(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=151(y1), r7=37(x2), r8=242(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 95
LDI r2, 108
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 151
LDI r7, 37
LDI r8, 242
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
