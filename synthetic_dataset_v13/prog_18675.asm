; DESCRIPTION: Creates a white rectangular region at (143, 4) spanning 96 by 46 pixels.
; PLAN: r0=143(x), r1=4(y), r2=96(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 4
LDI r2, 96
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
