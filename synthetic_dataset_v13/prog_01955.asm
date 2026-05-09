; DESCRIPTION: Renders a magenta box of size 14x76 starting at (422, 65).
; PLAN: r0=422(x), r1=65(y), r2=14(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 65
LDI r2, 14
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
