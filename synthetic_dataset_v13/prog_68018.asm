; DESCRIPTION: Creates a white rectangular region at (405, 44) spanning 93 by 114 pixels.
; PLAN: r0=405(x), r1=44(y), r2=93(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 44
LDI r2, 93
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
