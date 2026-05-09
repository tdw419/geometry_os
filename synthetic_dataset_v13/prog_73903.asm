; DESCRIPTION: Creates a white rectangular region at (124, 93) spanning 20 by 95 pixels.
; PLAN: r0=124(x), r1=93(y), r2=20(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 93
LDI r2, 20
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
