; DESCRIPTION: Creates a red rectangular region at (61, 65) spanning 14 by 65 pixels.
; PLAN: r0=61(x), r1=65(y), r2=14(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 65
LDI r2, 14
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
