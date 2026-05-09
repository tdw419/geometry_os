; DESCRIPTION: Creates a white rectangular region at (39, 132) spanning 93 by 12 pixels.
; PLAN: r0=39(x), r1=132(y), r2=93(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 132
LDI r2, 93
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
