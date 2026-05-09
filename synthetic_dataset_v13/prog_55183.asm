; DESCRIPTION: Creates a red rectangular region at (83, 206) spanning 28 by 21 pixels.
; PLAN: r0=83(x), r1=206(y), r2=28(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 206
LDI r2, 28
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
