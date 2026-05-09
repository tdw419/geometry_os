; DESCRIPTION: Places a magenta 75x21 rectangle at position (113, 169).
; PLAN: r0=113(x), r1=169(y), r2=75(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 169
LDI r2, 75
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
