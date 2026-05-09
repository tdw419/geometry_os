; DESCRIPTION: Creates a purple rectangular region at (251, 58) spanning 98 by 120 pixels.
; PLAN: r0=251(x), r1=58(y), r2=98(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 58
LDI r2, 98
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
