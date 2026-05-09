; DESCRIPTION: Creates a red rectangular region at (163, 214) spanning 52 by 23 pixels.
; PLAN: r0=163(x), r1=214(y), r2=52(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 214
LDI r2, 52
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
