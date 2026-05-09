; DESCRIPTION: Creates a red rectangular region at (207, 95) spanning 92 by 76 pixels.
; PLAN: r0=207(x), r1=95(y), r2=92(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 95
LDI r2, 92
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
