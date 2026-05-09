; DESCRIPTION: Places a magenta 30x11 rectangle at position (374, 169).
; PLAN: r0=374(x), r1=169(y), r2=30(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 169
LDI r2, 30
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
