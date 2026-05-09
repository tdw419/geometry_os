; DESCRIPTION: Places a magenta 48x109 rectangle at position (361, 20).
; PLAN: r0=361(x), r1=20(y), r2=48(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 20
LDI r2, 48
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
