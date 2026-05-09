; DESCRIPTION: Renders a magenta box of size 75x12 starting at (422, 83).
; PLAN: r0=422(x), r1=83(y), r2=75(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 83
LDI r2, 75
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
