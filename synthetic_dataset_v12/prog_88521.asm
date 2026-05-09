; DESCRIPTION: Renders a magenta box of size 15x69 starting at (410, 54).
; PLAN: r0=410(x), r1=54(y), r2=15(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 54
LDI r2, 15
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
