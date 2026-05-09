; DESCRIPTION: Creates a black rectangular region at (262, 132) spanning 71 by 63 pixels.
; PLAN: r0=262(x), r1=132(y), r2=71(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 132
LDI r2, 71
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
