; DESCRIPTION: Creates a purple rectangular region at (410, 180) spanning 48 by 74 pixels.
; PLAN: r0=410(x), r1=180(y), r2=48(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 180
LDI r2, 48
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
