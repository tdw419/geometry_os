; DESCRIPTION: Creates a red rectangular region at (1, 107) spanning 115 by 120 pixels.
; PLAN: r0=1(x), r1=107(y), r2=115(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 107
LDI r2, 115
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
