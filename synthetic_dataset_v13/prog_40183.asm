; DESCRIPTION: Creates a white rectangular region at (175, 73) spanning 28 by 111 pixels.
; PLAN: r0=175(x), r1=73(y), r2=28(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 73
LDI r2, 28
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
