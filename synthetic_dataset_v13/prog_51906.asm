; DESCRIPTION: Renders a purple box of size 71x48 starting at (298, 102).
; PLAN: r0=298(x), r1=102(y), r2=71(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 102
LDI r2, 71
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
