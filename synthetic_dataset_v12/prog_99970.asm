; DESCRIPTION: Renders a magenta box of size 80x57 starting at (231, 171).
; PLAN: r0=231(x), r1=171(y), r2=80(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 171
LDI r2, 80
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
