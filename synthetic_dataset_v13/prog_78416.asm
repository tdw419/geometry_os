; DESCRIPTION: Creates a red rectangular region at (377, 130) spanning 94 by 59 pixels.
; PLAN: r0=377(x), r1=130(y), r2=94(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 130
LDI r2, 94
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
