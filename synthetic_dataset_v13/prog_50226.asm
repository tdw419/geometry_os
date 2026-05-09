; DESCRIPTION: Creates a red rectangular region at (1, 120) spanning 33 by 107 pixels.
; PLAN: r0=1(x), r1=120(y), r2=33(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 120
LDI r2, 33
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
