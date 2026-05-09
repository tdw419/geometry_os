; DESCRIPTION: Renders a magenta box of size 51x59 starting at (388, 117).
; PLAN: r0=388(x), r1=117(y), r2=51(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 117
LDI r2, 51
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
