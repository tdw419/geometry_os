; DESCRIPTION: Creates a red rectangular region at (285, 91) spanning 30 by 95 pixels.
; PLAN: r0=285(x), r1=91(y), r2=30(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 91
LDI r2, 30
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
