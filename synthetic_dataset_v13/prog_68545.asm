; DESCRIPTION: Creates a black rectangular region at (150, 131) spanning 61 by 67 pixels.
; PLAN: r0=150(x), r1=131(y), r2=61(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 131
LDI r2, 61
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
