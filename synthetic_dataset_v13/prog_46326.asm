; DESCRIPTION: Creates a red rectangular region at (121, 151) spanning 25 by 33 pixels.
; PLAN: r0=121(x), r1=151(y), r2=25(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 151
LDI r2, 25
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
