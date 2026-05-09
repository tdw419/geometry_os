; DESCRIPTION: Creates a red rectangular region at (61, 132) spanning 80 by 71 pixels.
; PLAN: r0=61(x), r1=132(y), r2=80(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 132
LDI r2, 80
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
