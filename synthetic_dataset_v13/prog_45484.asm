; DESCRIPTION: Creates a green rectangular region at (418, 71) spanning 67 by 82 pixels.
; PLAN: r0=418(x), r1=71(y), r2=67(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 71
LDI r2, 67
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
