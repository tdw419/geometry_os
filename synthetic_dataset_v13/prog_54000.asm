; DESCRIPTION: Creates a red rectangular region at (392, 131) spanning 105 by 108 pixels.
; PLAN: r0=392(x), r1=131(y), r2=105(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 131
LDI r2, 105
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
