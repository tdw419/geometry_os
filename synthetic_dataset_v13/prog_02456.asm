; DESCRIPTION: Creates a green rectangular region at (365, 60) spanning 115 by 77 pixels.
; PLAN: r0=365(x), r1=60(y), r2=115(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 60
LDI r2, 115
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
