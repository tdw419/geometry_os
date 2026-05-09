; DESCRIPTION: Creates a white rectangular region at (191, 31) spanning 89 by 42 pixels.
; PLAN: r0=191(x), r1=31(y), r2=89(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 31
LDI r2, 89
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
