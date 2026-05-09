; DESCRIPTION: Creates a white rectangular region at (363, 37) spanning 93 by 50 pixels.
; PLAN: r0=363(x), r1=37(y), r2=93(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 37
LDI r2, 93
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
