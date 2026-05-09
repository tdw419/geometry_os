; DESCRIPTION: Renders a magenta box of size 74x120 starting at (84, 111).
; PLAN: r0=84(x), r1=111(y), r2=74(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 111
LDI r2, 74
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
