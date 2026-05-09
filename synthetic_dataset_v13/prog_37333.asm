; DESCRIPTION: Creates a black rectangular region at (208, 143) spanning 80 by 74 pixels.
; PLAN: r0=208(x), r1=143(y), r2=80(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 143
LDI r2, 80
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
