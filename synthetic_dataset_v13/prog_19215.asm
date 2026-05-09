; DESCRIPTION: Creates a red rectangular region at (36, 114) spanning 32 by 40 pixels.
; PLAN: r0=36(x), r1=114(y), r2=32(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 114
LDI r2, 32
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
