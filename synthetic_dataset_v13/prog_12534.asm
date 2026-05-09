; DESCRIPTION: Renders a purple box of size 117x71 starting at (354, 86).
; PLAN: r0=354(x), r1=86(y), r2=117(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 86
LDI r2, 117
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
