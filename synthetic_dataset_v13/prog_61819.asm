; DESCRIPTION: Creates a red rectangular region at (445, 12) spanning 66 by 120 pixels.
; PLAN: r0=445(x), r1=12(y), r2=66(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 12
LDI r2, 66
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
