; DESCRIPTION: Creates a magenta rectangular region at (340, 109) spanning 51 by 32 pixels.
; PLAN: r0=340(x), r1=109(y), r2=51(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 109
LDI r2, 51
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
