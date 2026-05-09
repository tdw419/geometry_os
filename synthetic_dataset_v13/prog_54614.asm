; DESCRIPTION: Creates a black rectangular region at (300, 149) spanning 28 by 107 pixels.
; PLAN: r0=300(x), r1=149(y), r2=28(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 149
LDI r2, 28
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
