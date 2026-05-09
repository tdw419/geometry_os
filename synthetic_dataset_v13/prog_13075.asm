; DESCRIPTION: Renders a magenta box of size 103x70 starting at (371, 14).
; PLAN: r0=371(x), r1=14(y), r2=103(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 14
LDI r2, 103
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
