; DESCRIPTION: Composite: Creates a red rectangular region at (217, 32) spanning 77 by 119 pixels then Places a white line segment connecting (456, 250) to (64, 235).
; PLAN: r0=217(x), r1=32(y), r2=77(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x1), r6=250(y1), r7=64(x2), r8=235(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 32
LDI r2, 77
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 250
LDI r7, 64
LDI r8, 235
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
