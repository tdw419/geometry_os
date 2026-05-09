; DESCRIPTION: Renders a blue box of size 87x46 starting at (263, 169).
; PLAN: r0=263(x), r1=169(y), r2=87(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 169
LDI r2, 87
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
