; DESCRIPTION: Creates a black rectangular region at (356, 194) spanning 42 by 11 pixels.
; PLAN: r0=356(x), r1=194(y), r2=42(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 194
LDI r2, 42
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
