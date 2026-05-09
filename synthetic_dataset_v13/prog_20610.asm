; DESCRIPTION: Renders a magenta box of size 51x83 starting at (152, 70).
; PLAN: r0=152(x), r1=70(y), r2=51(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 70
LDI r2, 51
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
