; DESCRIPTION: Creates a white rectangular region at (106, 120) spanning 68 by 120 pixels.
; PLAN: r0=106(x), r1=120(y), r2=68(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 120
LDI r2, 68
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
