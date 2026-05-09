; DESCRIPTION: Composite: Creates a white rectangular region at (44, 116) spanning 80 by 81 pixels then Places a red dot at position (470, 70).
; PLAN: r0=44(x), r1=116(y), r2=80(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=70(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 44
LDI r1, 116
LDI r2, 80
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 70
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
