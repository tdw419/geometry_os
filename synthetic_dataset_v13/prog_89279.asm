; DESCRIPTION: Creates a red rectangular region at (103, 140) spanning 36 by 30 pixels.
; PLAN: r0=103(x), r1=140(y), r2=36(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 140
LDI r2, 36
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
