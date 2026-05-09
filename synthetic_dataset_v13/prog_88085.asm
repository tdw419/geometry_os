; DESCRIPTION: Creates a purple rectangular region at (295, 8) spanning 27 by 23 pixels.
; PLAN: r0=295(x), r1=8(y), r2=27(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 8
LDI r2, 27
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
