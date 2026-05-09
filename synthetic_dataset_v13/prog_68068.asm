; DESCRIPTION: Places a red 65x94 rectangle at position (357, 46).
; PLAN: r0=357(x), r1=46(y), r2=65(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 46
LDI r2, 65
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
