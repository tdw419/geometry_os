; DESCRIPTION: Creates a white rectangular region at (278, 85) spanning 95 by 120 pixels.
; PLAN: r0=278(x), r1=85(y), r2=95(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 85
LDI r2, 95
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
