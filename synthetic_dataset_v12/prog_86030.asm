; DESCRIPTION: Creates a black rectangular region at (243, 125) spanning 53 by 61 pixels.
; PLAN: r0=243(x), r1=125(y), r2=53(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 125
LDI r2, 53
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
