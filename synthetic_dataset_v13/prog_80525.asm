; DESCRIPTION: Creates a blue rectangular region at (342, 206) spanning 82 by 10 pixels.
; PLAN: r0=342(x), r1=206(y), r2=82(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 206
LDI r2, 82
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
