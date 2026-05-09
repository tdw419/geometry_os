; DESCRIPTION: Creates a red rectangular region at (305, 130) spanning 29 by 14 pixels.
; PLAN: r0=305(x), r1=130(y), r2=29(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 130
LDI r2, 29
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
