; DESCRIPTION: Creates a white rectangular region at (345, 28) spanning 112 by 40 pixels.
; PLAN: r0=345(x), r1=28(y), r2=112(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 28
LDI r2, 112
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
