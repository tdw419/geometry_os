; DESCRIPTION: Creates a purple rectangular region at (104, 206) spanning 40 by 47 pixels.
; PLAN: r0=104(x), r1=206(y), r2=40(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 206
LDI r2, 40
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
