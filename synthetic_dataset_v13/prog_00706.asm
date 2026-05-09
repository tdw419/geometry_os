; DESCRIPTION: Creates a red rectangular region at (89, 42) spanning 120 by 114 pixels.
; PLAN: r0=89(x), r1=42(y), r2=120(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 42
LDI r2, 120
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
