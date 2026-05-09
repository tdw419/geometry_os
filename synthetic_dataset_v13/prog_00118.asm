; DESCRIPTION: Creates a purple rectangular region at (215, 16) spanning 21 by 37 pixels.
; PLAN: r0=215(x), r1=16(y), r2=21(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 16
LDI r2, 21
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
