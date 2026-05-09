; DESCRIPTION: Creates a black rectangular region at (235, 178) spanning 79 by 35 pixels.
; PLAN: r0=235(x), r1=178(y), r2=79(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 178
LDI r2, 79
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
