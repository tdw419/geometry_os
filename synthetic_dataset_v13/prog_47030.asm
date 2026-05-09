; DESCRIPTION: Creates a white rectangular region at (79, 14) spanning 50 by 35 pixels.
; PLAN: r0=79(x), r1=14(y), r2=50(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 14
LDI r2, 50
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
