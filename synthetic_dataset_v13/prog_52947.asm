; DESCRIPTION: Creates a white rectangular region at (165, 162) spanning 46 by 82 pixels.
; PLAN: r0=165(x), r1=162(y), r2=46(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 162
LDI r2, 46
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
