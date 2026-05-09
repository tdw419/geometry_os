; DESCRIPTION: Creates a red rectangular region at (219, 59) spanning 80 by 22 pixels.
; PLAN: r0=219(x), r1=59(y), r2=80(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 59
LDI r2, 80
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
