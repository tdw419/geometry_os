; DESCRIPTION: Renders a magenta box of size 38x87 starting at (247, 150).
; PLAN: r0=247(x), r1=150(y), r2=38(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 150
LDI r2, 38
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
