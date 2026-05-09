; DESCRIPTION: Creates a black rectangular region at (391, 235) spanning 80 by 13 pixels.
; PLAN: r0=391(x), r1=235(y), r2=80(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 235
LDI r2, 80
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
