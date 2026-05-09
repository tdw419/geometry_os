; DESCRIPTION: Creates a red rectangular region at (13, 124) spanning 21 by 94 pixels.
; PLAN: r0=13(x), r1=124(y), r2=21(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 124
LDI r2, 21
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
