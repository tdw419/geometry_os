; DESCRIPTION: Creates a red rectangular region at (260, 61) spanning 80 by 78 pixels.
; PLAN: r0=260(x), r1=61(y), r2=80(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 61
LDI r2, 80
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
