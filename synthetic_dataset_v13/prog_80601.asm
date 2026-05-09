; DESCRIPTION: Renders a magenta box of size 79x28 starting at (46, 216).
; PLAN: r0=46(x), r1=216(y), r2=79(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 216
LDI r2, 79
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
