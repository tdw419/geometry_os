; DESCRIPTION: Creates a red rectangular region at (182, 51) spanning 93 by 94 pixels.
; PLAN: r0=182(x), r1=51(y), r2=93(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 51
LDI r2, 93
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
