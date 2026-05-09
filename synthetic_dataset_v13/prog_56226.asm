; DESCRIPTION: Creates a purple rectangular region at (175, 229) spanning 51 by 13 pixels.
; PLAN: r0=175(x), r1=229(y), r2=51(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 229
LDI r2, 51
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
