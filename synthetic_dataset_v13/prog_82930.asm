; DESCRIPTION: Creates a white rectangular region at (280, 137) spanning 25 by 109 pixels.
; PLAN: r0=280(x), r1=137(y), r2=25(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 137
LDI r2, 25
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
