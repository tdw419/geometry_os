; DESCRIPTION: Renders a purple box of size 67x57 starting at (275, 44).
; PLAN: r0=275(x), r1=44(y), r2=67(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 44
LDI r2, 67
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
