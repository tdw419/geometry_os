; DESCRIPTION: Places a magenta 36x30 rectangle at position (271, 160).
; PLAN: r0=271(x), r1=160(y), r2=36(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 160
LDI r2, 36
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
