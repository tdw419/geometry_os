; DESCRIPTION: Creates a red rectangular region at (60, 45) spanning 45 by 44 pixels.
; PLAN: r0=60(x), r1=45(y), r2=45(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 45
LDI r2, 45
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
