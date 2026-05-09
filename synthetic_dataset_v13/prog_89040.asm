; DESCRIPTION: Creates a white rectangular region at (277, 126) spanning 11 by 89 pixels.
; PLAN: r0=277(x), r1=126(y), r2=11(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 126
LDI r2, 11
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
