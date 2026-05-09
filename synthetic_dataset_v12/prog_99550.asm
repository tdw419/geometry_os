; DESCRIPTION: Renders a magenta box of size 61x87 starting at (386, 169).
; PLAN: r0=386(x), r1=169(y), r2=61(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 169
LDI r2, 61
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
