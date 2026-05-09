; DESCRIPTION: Composite: Places a green circle of radius 62 at center (407, 179) then Creates a magenta rectangular region at (346, 133) spanning 74 by 55 pixels.
; PLAN: r0=407(x), r1=179(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=133(y), r7=74(width), r8=55(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 407
LDI r1, 179
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 133
LDI r7, 74
LDI r8, 55
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
