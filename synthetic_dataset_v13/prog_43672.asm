; DESCRIPTION: Creates a black rectangular region at (229, 98) spanning 116 by 16 pixels.
; PLAN: r0=229(x), r1=98(y), r2=116(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 98
LDI r2, 116
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
