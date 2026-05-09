; DESCRIPTION: Composite: Places a orange circle of radius 38 at center (317, 81) then Creates a black rectangular region at (102, 103) spanning 77 by 90 pixels.
; PLAN: r0=317(x), r1=81(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=103(y), r7=77(width), r8=90(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 81
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 103
LDI r7, 77
LDI r8, 90
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
