; DESCRIPTION: Creates a blue rectangular region at (352, 44) spanning 81 by 42 pixels.
; PLAN: r0=352(x), r1=44(y), r2=81(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 44
LDI r2, 81
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
