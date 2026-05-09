; DESCRIPTION: Creates a red rectangular region at (140, 107) spanning 47 by 72 pixels.
; PLAN: r0=140(x), r1=107(y), r2=47(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 107
LDI r2, 47
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
