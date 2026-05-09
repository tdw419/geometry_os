; DESCRIPTION: Creates a yellow rectangular region at (237, 109) spanning 68 by 46 pixels.
; PLAN: r0=237(x), r1=109(y), r2=68(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 109
LDI r2, 68
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
