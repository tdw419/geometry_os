; DESCRIPTION: Renders a magenta box of size 28x29 starting at (446, 207).
; PLAN: r0=446(x), r1=207(y), r2=28(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 207
LDI r2, 28
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
