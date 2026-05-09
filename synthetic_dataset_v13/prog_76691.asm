; DESCRIPTION: Composite: Creates a cyan rectangular region at (255, 87) spanning 23 by 59 pixels then Places a orange line segment connecting (395, 154) to (153, 235).
; PLAN: r0=255(x), r1=87(y), r2=23(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x1), r6=154(y1), r7=153(x2), r8=235(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 87
LDI r2, 23
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 154
LDI r7, 153
LDI r8, 235
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
