; DESCRIPTION: Creates a red rectangular region at (400, 126) spanning 56 by 73 pixels.
; PLAN: r0=400(x), r1=126(y), r2=56(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 126
LDI r2, 56
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
