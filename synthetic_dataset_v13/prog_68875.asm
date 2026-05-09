; DESCRIPTION: Creates a red rectangular region at (441, 29) spanning 67 by 89 pixels.
; PLAN: r0=441(x), r1=29(y), r2=67(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 29
LDI r2, 67
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
