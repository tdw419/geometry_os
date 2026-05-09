; DESCRIPTION: Creates a purple rectangular region at (82, 191) spanning 113 by 48 pixels.
; PLAN: r0=82(x), r1=191(y), r2=113(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 191
LDI r2, 113
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
