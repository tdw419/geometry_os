; DESCRIPTION: Creates a red rectangular region at (51, 26) spanning 98 by 113 pixels.
; PLAN: r0=51(x), r1=26(y), r2=98(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 26
LDI r2, 98
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
