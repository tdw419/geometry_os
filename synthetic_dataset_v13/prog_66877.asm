; DESCRIPTION: Creates a white rectangular region at (176, 120) spanning 12 by 98 pixels.
; PLAN: r0=176(x), r1=120(y), r2=12(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 120
LDI r2, 12
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
