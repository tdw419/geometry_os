; DESCRIPTION: Creates a white rectangular region at (60, 53) spanning 33 by 50 pixels.
; PLAN: r0=60(x), r1=53(y), r2=33(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 53
LDI r2, 33
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
