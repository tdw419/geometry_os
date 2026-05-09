; DESCRIPTION: Creates a red rectangular region at (411, 114) spanning 72 by 95 pixels.
; PLAN: r0=411(x), r1=114(y), r2=72(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 114
LDI r2, 72
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
