; DESCRIPTION: Places a magenta 28x56 rectangle at position (288, 169).
; PLAN: r0=288(x), r1=169(y), r2=28(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 169
LDI r2, 28
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
