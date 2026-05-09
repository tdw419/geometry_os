; DESCRIPTION: Creates a black rectangular region at (196, 86) spanning 87 by 79 pixels.
; PLAN: r0=196(x), r1=86(y), r2=87(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 86
LDI r2, 87
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
