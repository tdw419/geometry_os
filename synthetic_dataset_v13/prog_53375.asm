; DESCRIPTION: Creates a white rectangular region at (340, 5) spanning 15 by 95 pixels.
; PLAN: r0=340(x), r1=5(y), r2=15(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 5
LDI r2, 15
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
