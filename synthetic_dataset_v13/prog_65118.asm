; DESCRIPTION: Creates a white rectangular region at (450, 1) spanning 30 by 26 pixels.
; PLAN: r0=450(x), r1=1(y), r2=30(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 1
LDI r2, 30
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
