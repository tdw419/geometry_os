; DESCRIPTION: Creates a red rectangular region at (366, 197) spanning 116 by 33 pixels.
; PLAN: r0=366(x), r1=197(y), r2=116(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 197
LDI r2, 116
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
