; DESCRIPTION: Creates a purple rectangular region at (57, 117) spanning 80 by 120 pixels.
; PLAN: r0=57(x), r1=117(y), r2=80(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 117
LDI r2, 80
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
