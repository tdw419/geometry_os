; DESCRIPTION: Renders a magenta box of size 31x87 starting at (419, 47).
; PLAN: r0=419(x), r1=47(y), r2=31(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 47
LDI r2, 31
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
