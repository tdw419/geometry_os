; DESCRIPTION: Creates a white rectangular region at (87, 79) spanning 109 by 35 pixels.
; PLAN: r0=87(x), r1=79(y), r2=109(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 79
LDI r2, 109
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
