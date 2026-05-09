; DESCRIPTION: Creates a red rectangular region at (149, 209) spanning 89 by 30 pixels.
; PLAN: r0=149(x), r1=209(y), r2=89(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 209
LDI r2, 89
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
