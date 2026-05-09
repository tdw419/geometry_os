; DESCRIPTION: Creates a white rectangular region at (69, 150) spanning 85 by 30 pixels.
; PLAN: r0=69(x), r1=150(y), r2=85(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 150
LDI r2, 85
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
