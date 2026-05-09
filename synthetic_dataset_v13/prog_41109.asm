; DESCRIPTION: Places a yellow 76x55 rectangle at position (357, 188).
; PLAN: r0=357(x), r1=188(y), r2=76(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 188
LDI r2, 76
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
