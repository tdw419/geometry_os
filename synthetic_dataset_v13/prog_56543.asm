; DESCRIPTION: Creates a purple rectangular region at (386, 46) spanning 86 by 58 pixels.
; PLAN: r0=386(x), r1=46(y), r2=86(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 46
LDI r2, 86
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
