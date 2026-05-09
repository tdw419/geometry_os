; DESCRIPTION: Renders a purple box of size 44x64 starting at (409, 191).
; PLAN: r0=409(x), r1=191(y), r2=44(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 191
LDI r2, 44
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
