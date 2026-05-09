; DESCRIPTION: Creates a red rectangular region at (180, 32) spanning 35 by 51 pixels.
; PLAN: r0=180(x), r1=32(y), r2=35(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 32
LDI r2, 35
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
