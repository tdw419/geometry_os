; DESCRIPTION: Renders a magenta box of size 40x83 starting at (178, 120).
; PLAN: r0=178(x), r1=120(y), r2=40(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 120
LDI r2, 40
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
