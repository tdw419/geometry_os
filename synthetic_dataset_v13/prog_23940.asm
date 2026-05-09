; DESCRIPTION: Composite: Draws a cyan line from (81, 232) to (459, 135) then Creates a green rectangular region at (326, 49) spanning 108 by 50 pixels.
; PLAN: r0=81(x1), r1=232(y1), r2=459(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=49(y), r7=108(width), r8=50(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 232
LDI r2, 459
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 49
LDI r7, 108
LDI r8, 50
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
