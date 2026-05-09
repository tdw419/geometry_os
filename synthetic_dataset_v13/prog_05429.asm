; DESCRIPTION: Creates a blue rectangular region at (454, 228) spanning 51 by 21 pixels.
; PLAN: r0=454(x), r1=228(y), r2=51(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 228
LDI r2, 51
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
