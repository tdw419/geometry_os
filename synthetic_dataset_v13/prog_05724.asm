; DESCRIPTION: Creates a red rectangular region at (108, 164) spanning 90 by 56 pixels.
; PLAN: r0=108(x), r1=164(y), r2=90(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 164
LDI r2, 90
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
