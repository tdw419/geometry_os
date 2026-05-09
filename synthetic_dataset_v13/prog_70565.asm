; DESCRIPTION: Creates a white rectangular region at (481, 9) spanning 26 by 46 pixels.
; PLAN: r0=481(x), r1=9(y), r2=26(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 9
LDI r2, 26
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
