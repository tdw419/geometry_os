; DESCRIPTION: Renders a magenta box of size 110x38 starting at (187, 169).
; PLAN: r0=187(x), r1=169(y), r2=110(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 169
LDI r2, 110
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
