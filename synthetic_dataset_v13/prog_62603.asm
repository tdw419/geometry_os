; DESCRIPTION: Creates a yellow rectangular region at (464, 171) spanning 45 by 81 pixels.
; PLAN: r0=464(x), r1=171(y), r2=45(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 171
LDI r2, 45
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
