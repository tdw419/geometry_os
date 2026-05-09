; DESCRIPTION: Renders a magenta box of size 40x47 starting at (79, 198).
; PLAN: r0=79(x), r1=198(y), r2=40(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 198
LDI r2, 40
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
