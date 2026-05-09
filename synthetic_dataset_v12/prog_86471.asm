; DESCRIPTION: Renders a magenta box of size 89x87 starting at (249, 29).
; PLAN: r0=249(x), r1=29(y), r2=89(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 29
LDI r2, 89
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
