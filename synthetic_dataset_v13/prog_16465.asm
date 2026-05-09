; DESCRIPTION: Creates a black rectangular region at (358, 149) spanning 60 by 25 pixels.
; PLAN: r0=358(x), r1=149(y), r2=60(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 149
LDI r2, 60
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
