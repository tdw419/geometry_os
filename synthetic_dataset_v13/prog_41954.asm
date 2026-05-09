; DESCRIPTION: Creates a black rectangular region at (307, 131) spanning 115 by 61 pixels.
; PLAN: r0=307(x), r1=131(y), r2=115(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 131
LDI r2, 115
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
