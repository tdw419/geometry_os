; DESCRIPTION: Renders a magenta box of size 43x81 starting at (392, 16).
; PLAN: r0=392(x), r1=16(y), r2=43(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 16
LDI r2, 43
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
