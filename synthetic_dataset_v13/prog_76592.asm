; DESCRIPTION: Creates a purple rectangular region at (331, 44) spanning 86 by 120 pixels.
; PLAN: r0=331(x), r1=44(y), r2=86(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 44
LDI r2, 86
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
