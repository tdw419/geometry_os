; DESCRIPTION: Creates a white rectangular region at (286, 116) spanning 104 by 77 pixels.
; PLAN: r0=286(x), r1=116(y), r2=104(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 116
LDI r2, 104
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
