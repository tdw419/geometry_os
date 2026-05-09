; DESCRIPTION: Renders a magenta box of size 94x45 starting at (416, 77).
; PLAN: r0=416(x), r1=77(y), r2=94(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 77
LDI r2, 94
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
