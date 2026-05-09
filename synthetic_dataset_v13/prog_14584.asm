; DESCRIPTION: Renders a magenta box of size 57x109 starting at (428, 39).
; PLAN: r0=428(x), r1=39(y), r2=57(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 39
LDI r2, 57
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
