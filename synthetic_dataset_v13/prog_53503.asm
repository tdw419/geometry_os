; DESCRIPTION: Composite: Creates a cyan rectangular region at (257, 83) spanning 47 by 108 pixels then Renders a blue line between points (501, 178) and (210, 10).
; PLAN: r0=257(x), r1=83(y), r2=47(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x1), r6=178(y1), r7=210(x2), r8=10(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 83
LDI r2, 47
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 178
LDI r7, 210
LDI r8, 10
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
