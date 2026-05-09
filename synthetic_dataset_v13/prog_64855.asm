; DESCRIPTION: Creates a red rectangular region at (1, 142) spanning 29 by 57 pixels.
; PLAN: r0=1(x), r1=142(y), r2=29(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 142
LDI r2, 29
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
