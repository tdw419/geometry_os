; DESCRIPTION: Creates a red rectangular region at (415, 70) spanning 58 by 90 pixels.
; PLAN: r0=415(x), r1=70(y), r2=58(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 70
LDI r2, 58
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
