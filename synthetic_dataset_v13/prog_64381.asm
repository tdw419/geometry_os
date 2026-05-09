; DESCRIPTION: Places a magenta 101x21 rectangle at position (24, 169).
; PLAN: r0=24(x), r1=169(y), r2=101(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 169
LDI r2, 101
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
