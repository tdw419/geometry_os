; DESCRIPTION: Renders a purple box of size 60x57 starting at (237, 125).
; PLAN: r0=237(x), r1=125(y), r2=60(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 125
LDI r2, 60
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
