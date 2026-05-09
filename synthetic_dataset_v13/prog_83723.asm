; DESCRIPTION: Creates a white rectangular region at (117, 120) spanning 62 by 27 pixels.
; PLAN: r0=117(x), r1=120(y), r2=62(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 120
LDI r2, 62
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
