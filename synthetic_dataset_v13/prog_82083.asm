; DESCRIPTION: Places a magenta 70x87 rectangle at position (285, 169).
; PLAN: r0=285(x), r1=169(y), r2=70(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 169
LDI r2, 70
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
