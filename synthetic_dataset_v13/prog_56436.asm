; DESCRIPTION: Renders a magenta box of size 60x42 starting at (133, 46).
; PLAN: r0=133(x), r1=46(y), r2=60(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 46
LDI r2, 60
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
