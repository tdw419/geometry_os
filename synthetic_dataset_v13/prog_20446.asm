; DESCRIPTION: Creates a black rectangular region at (151, 164) spanning 12 by 16 pixels.
; PLAN: r0=151(x), r1=164(y), r2=12(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 164
LDI r2, 12
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
