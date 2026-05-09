; DESCRIPTION: Renders a magenta box of size 107x70 starting at (250, 76).
; PLAN: r0=250(x), r1=76(y), r2=107(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 76
LDI r2, 107
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
