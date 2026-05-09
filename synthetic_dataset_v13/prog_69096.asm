; DESCRIPTION: Creates a white rectangular region at (27, 5) spanning 55 by 80 pixels.
; PLAN: r0=27(x), r1=5(y), r2=55(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 5
LDI r2, 55
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
