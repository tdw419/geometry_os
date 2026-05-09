; DESCRIPTION: Creates a white rectangular region at (365, 50) spanning 22 by 118 pixels.
; PLAN: r0=365(x), r1=50(y), r2=22(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 50
LDI r2, 22
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
