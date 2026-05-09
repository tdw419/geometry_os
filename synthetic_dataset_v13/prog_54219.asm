; DESCRIPTION: Creates a white rectangular region at (262, 26) spanning 96 by 79 pixels.
; PLAN: r0=262(x), r1=26(y), r2=96(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 26
LDI r2, 96
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
