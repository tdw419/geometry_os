; DESCRIPTION: Creates a red rectangular region at (90, 87) spanning 54 by 40 pixels.
; PLAN: r0=90(x), r1=87(y), r2=54(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 87
LDI r2, 54
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
