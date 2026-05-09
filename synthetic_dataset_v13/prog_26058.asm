; DESCRIPTION: Renders a magenta box of size 71x44 starting at (82, 98).
; PLAN: r0=82(x), r1=98(y), r2=71(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 98
LDI r2, 71
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
