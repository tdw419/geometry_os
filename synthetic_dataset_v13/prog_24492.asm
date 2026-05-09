; DESCRIPTION: Creates a white rectangular region at (195, 5) spanning 93 by 120 pixels.
; PLAN: r0=195(x), r1=5(y), r2=93(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 5
LDI r2, 93
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
