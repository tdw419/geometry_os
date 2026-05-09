; DESCRIPTION: Creates a red rectangular region at (207, 132) spanning 72 by 61 pixels.
; PLAN: r0=207(x), r1=132(y), r2=72(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 132
LDI r2, 72
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
