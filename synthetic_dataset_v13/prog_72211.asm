; DESCRIPTION: Creates a black rectangular region at (261, 177) spanning 67 by 27 pixels.
; PLAN: r0=261(x), r1=177(y), r2=67(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 177
LDI r2, 67
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
