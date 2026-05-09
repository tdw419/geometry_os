; DESCRIPTION: Creates a yellow rectangular region at (333, 133) spanning 71 by 61 pixels.
; PLAN: r0=333(x), r1=133(y), r2=71(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 133
LDI r2, 71
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
