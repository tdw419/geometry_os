; DESCRIPTION: Renders a yellow box of size 66x89 starting at (298, 19).
; PLAN: r0=298(x), r1=19(y), r2=66(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 19
LDI r2, 66
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
