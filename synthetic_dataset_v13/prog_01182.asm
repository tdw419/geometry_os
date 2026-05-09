; DESCRIPTION: Creates a purple rectangular region at (415, 25) spanning 61 by 120 pixels.
; PLAN: r0=415(x), r1=25(y), r2=61(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 25
LDI r2, 61
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
