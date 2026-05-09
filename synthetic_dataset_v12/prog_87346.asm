; DESCRIPTION: Creates a purple rectangular region at (270, 152) spanning 93 by 39 pixels.
; PLAN: r0=270(x), r1=152(y), r2=93(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 152
LDI r2, 93
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
