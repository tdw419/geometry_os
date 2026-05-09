; DESCRIPTION: Creates a red rectangular region at (333, 151) spanning 105 by 44 pixels.
; PLAN: r0=333(x), r1=151(y), r2=105(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 151
LDI r2, 105
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
