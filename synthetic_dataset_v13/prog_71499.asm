; DESCRIPTION: Composite: Places a cyan circle of radius 62 at center (188, 135) then Creates a magenta rectangular region at (477, 187) spanning 33 by 59 pixels.
; PLAN: r0=188(x), r1=135(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x), r6=187(y), r7=33(width), r8=59(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 135
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 187
LDI r7, 33
LDI r8, 59
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
