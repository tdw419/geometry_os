; DESCRIPTION: Renders a magenta box of size 95x43 starting at (277, 110).
; PLAN: r0=277(x), r1=110(y), r2=95(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 110
LDI r2, 95
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
