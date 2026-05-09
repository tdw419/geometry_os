; DESCRIPTION: Creates a white rectangular region at (333, 169) spanning 73 by 71 pixels.
; PLAN: r0=333(x), r1=169(y), r2=73(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 169
LDI r2, 73
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
