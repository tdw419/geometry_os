; DESCRIPTION: Creates a red rectangular region at (149, 151) spanning 48 by 51 pixels.
; PLAN: r0=149(x), r1=151(y), r2=48(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 151
LDI r2, 48
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
