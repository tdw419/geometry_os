; DESCRIPTION: Creates a black rectangular region at (193, 59) spanning 28 by 64 pixels.
; PLAN: r0=193(x), r1=59(y), r2=28(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 59
LDI r2, 28
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
