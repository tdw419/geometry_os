; DESCRIPTION: Creates a red rectangular region at (160, 96) spanning 93 by 70 pixels.
; PLAN: r0=160(x), r1=96(y), r2=93(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 96
LDI r2, 93
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
