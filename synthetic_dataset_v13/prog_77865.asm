; DESCRIPTION: Places a magenta 107x85 rectangle at position (357, 46).
; PLAN: r0=357(x), r1=46(y), r2=107(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 46
LDI r2, 107
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
