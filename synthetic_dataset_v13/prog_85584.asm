; DESCRIPTION: Creates a black rectangular region at (229, 37) spanning 67 by 107 pixels.
; PLAN: r0=229(x), r1=37(y), r2=67(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 37
LDI r2, 67
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
