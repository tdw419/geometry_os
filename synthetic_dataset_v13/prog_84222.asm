; DESCRIPTION: Creates a red rectangular region at (213, 44) spanning 60 by 34 pixels.
; PLAN: r0=213(x), r1=44(y), r2=60(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 44
LDI r2, 60
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
