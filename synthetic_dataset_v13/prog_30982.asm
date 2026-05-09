; DESCRIPTION: Renders a magenta box of size 47x77 starting at (328, 22).
; PLAN: r0=328(x), r1=22(y), r2=47(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 22
LDI r2, 47
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
