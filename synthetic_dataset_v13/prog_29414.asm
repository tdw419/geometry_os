; DESCRIPTION: Creates a white rectangular region at (85, 109) spanning 95 by 50 pixels.
; PLAN: r0=85(x), r1=109(y), r2=95(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 109
LDI r2, 95
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
