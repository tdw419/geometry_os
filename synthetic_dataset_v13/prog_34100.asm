; DESCRIPTION: Renders a purple box of size 60x27 starting at (243, 124).
; PLAN: r0=243(x), r1=124(y), r2=60(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 124
LDI r2, 60
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
