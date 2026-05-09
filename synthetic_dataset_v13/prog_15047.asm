; DESCRIPTION: Creates a black rectangular region at (264, 149) spanning 39 by 71 pixels.
; PLAN: r0=264(x), r1=149(y), r2=39(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 149
LDI r2, 39
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
