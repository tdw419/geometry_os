; DESCRIPTION: Creates a white rectangular region at (483, 30) spanning 14 by 120 pixels.
; PLAN: r0=483(x), r1=30(y), r2=14(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 30
LDI r2, 14
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
