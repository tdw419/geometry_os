; DESCRIPTION: Creates a red rectangular region at (326, 141) spanning 36 by 112 pixels.
; PLAN: r0=326(x), r1=141(y), r2=36(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 141
LDI r2, 36
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
