; DESCRIPTION: Creates a black rectangular region at (362, 37) spanning 87 by 14 pixels.
; PLAN: r0=362(x), r1=37(y), r2=87(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 37
LDI r2, 87
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
