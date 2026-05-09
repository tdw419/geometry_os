; DESCRIPTION: Creates a red rectangular region at (263, 83) spanning 51 by 84 pixels.
; PLAN: r0=263(x), r1=83(y), r2=51(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 83
LDI r2, 51
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
