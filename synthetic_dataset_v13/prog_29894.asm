; DESCRIPTION: Places a magenta 10x38 rectangle at position (196, 169).
; PLAN: r0=196(x), r1=169(y), r2=10(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 169
LDI r2, 10
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
