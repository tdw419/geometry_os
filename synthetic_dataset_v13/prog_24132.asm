; DESCRIPTION: Places a magenta 72x20 rectangle at position (332, 188).
; PLAN: r0=332(x), r1=188(y), r2=72(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 188
LDI r2, 72
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
