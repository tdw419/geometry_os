; DESCRIPTION: Renders a magenta box of size 50x59 starting at (130, 185).
; PLAN: r0=130(x), r1=185(y), r2=50(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 185
LDI r2, 50
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
