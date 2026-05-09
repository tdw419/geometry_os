; DESCRIPTION: Renders a magenta box of size 99x103 starting at (186, 119).
; PLAN: r0=186(x), r1=119(y), r2=99(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 119
LDI r2, 99
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
