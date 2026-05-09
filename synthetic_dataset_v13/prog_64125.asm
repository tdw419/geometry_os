; DESCRIPTION: Creates a blue rectangular region at (228, 32) spanning 107 by 56 pixels.
; PLAN: r0=228(x), r1=32(y), r2=107(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 32
LDI r2, 107
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
