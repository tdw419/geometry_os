; DESCRIPTION: Creates a red rectangular region at (386, 149) spanning 119 by 29 pixels.
; PLAN: r0=386(x), r1=149(y), r2=119(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 149
LDI r2, 119
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
