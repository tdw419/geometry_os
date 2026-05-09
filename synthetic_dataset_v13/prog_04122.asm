; DESCRIPTION: Creates a white rectangular region at (307, 140) spanning 71 by 39 pixels.
; PLAN: r0=307(x), r1=140(y), r2=71(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 140
LDI r2, 71
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
