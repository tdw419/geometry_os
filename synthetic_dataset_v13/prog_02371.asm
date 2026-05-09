; DESCRIPTION: Places a magenta 95x95 rectangle at position (177, 160).
; PLAN: r0=177(x), r1=160(y), r2=95(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 160
LDI r2, 95
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
