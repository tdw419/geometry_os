; DESCRIPTION: Creates a purple rectangular region at (65, 212) spanning 27 by 18 pixels.
; PLAN: r0=65(x), r1=212(y), r2=27(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 212
LDI r2, 27
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
