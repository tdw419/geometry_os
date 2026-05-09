; DESCRIPTION: Renders a magenta box of size 51x13 starting at (433, 168).
; PLAN: r0=433(x), r1=168(y), r2=51(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 168
LDI r2, 51
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
