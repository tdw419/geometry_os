; DESCRIPTION: Creates a white rectangular region at (126, 118) spanning 93 by 45 pixels.
; PLAN: r0=126(x), r1=118(y), r2=93(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 118
LDI r2, 93
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
