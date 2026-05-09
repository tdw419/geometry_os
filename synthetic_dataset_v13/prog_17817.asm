; DESCRIPTION: Creates a purple rectangular region at (167, 168) spanning 89 by 61 pixels.
; PLAN: r0=167(x), r1=168(y), r2=89(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 168
LDI r2, 89
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
