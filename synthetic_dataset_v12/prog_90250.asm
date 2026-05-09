; DESCRIPTION: Creates a yellow rectangular region at (182, 141) spanning 120 by 112 pixels.
; PLAN: r0=182(x), r1=141(y), r2=120(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 141
LDI r2, 120
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
