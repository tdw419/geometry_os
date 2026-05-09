; DESCRIPTION: Creates a red rectangular region at (160, 59) spanning 58 by 21 pixels.
; PLAN: r0=160(x), r1=59(y), r2=58(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 59
LDI r2, 58
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
