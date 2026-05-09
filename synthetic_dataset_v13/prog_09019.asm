; DESCRIPTION: Creates a purple rectangular region at (387, 195) spanning 64 by 12 pixels.
; PLAN: r0=387(x), r1=195(y), r2=64(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 195
LDI r2, 64
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
