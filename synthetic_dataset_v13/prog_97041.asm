; DESCRIPTION: Creates a white rectangular region at (309, 103) spanning 77 by 11 pixels.
; PLAN: r0=309(x), r1=103(y), r2=77(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 103
LDI r2, 77
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
