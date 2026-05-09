; DESCRIPTION: Creates a white rectangular region at (95, 124) spanning 120 by 23 pixels.
; PLAN: r0=95(x), r1=124(y), r2=120(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 124
LDI r2, 120
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
