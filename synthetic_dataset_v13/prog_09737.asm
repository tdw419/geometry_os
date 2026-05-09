; DESCRIPTION: Creates a red rectangular region at (333, 80) spanning 84 by 23 pixels.
; PLAN: r0=333(x), r1=80(y), r2=84(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 80
LDI r2, 84
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
