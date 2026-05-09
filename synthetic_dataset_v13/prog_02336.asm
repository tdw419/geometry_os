; DESCRIPTION: Draws a cyan circle centered at (465, 177) with radius 41.
; PLAN: r0=465(x), r1=177(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 177
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
