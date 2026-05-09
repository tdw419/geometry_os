; DESCRIPTION: Creates a white rectangular region at (214, 82) spanning 85 by 100 pixels.
; PLAN: r0=214(x), r1=82(y), r2=85(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 82
LDI r2, 85
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
