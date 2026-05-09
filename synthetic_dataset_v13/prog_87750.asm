; DESCRIPTION: Renders a blue box of size 71x100 starting at (127, 146).
; PLAN: r0=127(x), r1=146(y), r2=71(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 146
LDI r2, 71
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
