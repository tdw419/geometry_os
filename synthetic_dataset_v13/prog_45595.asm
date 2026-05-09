; DESCRIPTION: Creates a white rectangular region at (387, 81) spanning 112 by 46 pixels.
; PLAN: r0=387(x), r1=81(y), r2=112(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 81
LDI r2, 112
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
