; DESCRIPTION: Creates a black rectangular region at (151, 205) spanning 79 by 47 pixels.
; PLAN: r0=151(x), r1=205(y), r2=79(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 205
LDI r2, 79
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
