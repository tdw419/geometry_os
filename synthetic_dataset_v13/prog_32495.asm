; DESCRIPTION: Creates a red rectangular region at (125, 146) spanning 61 by 14 pixels.
; PLAN: r0=125(x), r1=146(y), r2=61(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 146
LDI r2, 61
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
