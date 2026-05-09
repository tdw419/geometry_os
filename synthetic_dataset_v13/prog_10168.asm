; DESCRIPTION: Creates a red rectangular region at (156, 100) spanning 11 by 120 pixels.
; PLAN: r0=156(x), r1=100(y), r2=11(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 100
LDI r2, 11
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
