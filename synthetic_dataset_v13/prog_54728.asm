; DESCRIPTION: Creates a blue rectangular region at (268, 103) spanning 81 by 50 pixels.
; PLAN: r0=268(x), r1=103(y), r2=81(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 103
LDI r2, 81
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
