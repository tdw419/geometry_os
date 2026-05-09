; DESCRIPTION: Creates a red rectangular region at (79, 61) spanning 59 by 34 pixels.
; PLAN: r0=79(x), r1=61(y), r2=59(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 61
LDI r2, 59
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
