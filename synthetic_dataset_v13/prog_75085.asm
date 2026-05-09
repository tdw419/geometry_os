; DESCRIPTION: Creates a black rectangular region at (196, 109) spanning 36 by 12 pixels.
; PLAN: r0=196(x), r1=109(y), r2=36(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 109
LDI r2, 36
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
