; DESCRIPTION: Creates a white rectangular region at (4, 57) spanning 120 by 33 pixels.
; PLAN: r0=4(x), r1=57(y), r2=120(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 57
LDI r2, 120
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
