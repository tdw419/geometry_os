; DESCRIPTION: Places a magenta 106x109 rectangle at position (277, 116).
; PLAN: r0=277(x), r1=116(y), r2=106(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 116
LDI r2, 106
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
