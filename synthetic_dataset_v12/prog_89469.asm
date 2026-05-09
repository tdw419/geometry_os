; DESCRIPTION: Creates a purple rectangular region at (374, 215) spanning 32 by 23 pixels.
; PLAN: r0=374(x), r1=215(y), r2=32(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 215
LDI r2, 32
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
