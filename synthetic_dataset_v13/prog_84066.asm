; DESCRIPTION: Creates a black rectangular region at (208, 50) spanning 116 by 99 pixels.
; PLAN: r0=208(x), r1=50(y), r2=116(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 50
LDI r2, 116
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
