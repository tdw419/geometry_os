; DESCRIPTION: Places a magenta 65x24 rectangle at position (214, 145).
; PLAN: r0=214(x), r1=145(y), r2=65(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 145
LDI r2, 65
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
