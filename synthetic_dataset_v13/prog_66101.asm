; DESCRIPTION: Creates a blue rectangular region at (342, 103) spanning 114 by 79 pixels.
; PLAN: r0=342(x), r1=103(y), r2=114(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 103
LDI r2, 114
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
