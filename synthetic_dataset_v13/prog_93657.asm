; DESCRIPTION: Creates a white rectangular region at (98, 120) spanning 82 by 30 pixels.
; PLAN: r0=98(x), r1=120(y), r2=82(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 120
LDI r2, 82
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
