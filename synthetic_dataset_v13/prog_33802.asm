; DESCRIPTION: Creates a black rectangular region at (365, 109) spanning 16 by 39 pixels.
; PLAN: r0=365(x), r1=109(y), r2=16(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 109
LDI r2, 16
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
