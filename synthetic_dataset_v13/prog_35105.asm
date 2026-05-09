; DESCRIPTION: Places a magenta 65x11 rectangle at position (260, 199).
; PLAN: r0=260(x), r1=199(y), r2=65(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 199
LDI r2, 65
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
