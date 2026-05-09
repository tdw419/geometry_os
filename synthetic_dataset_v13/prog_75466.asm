; DESCRIPTION: Renders a yellow box of size 36x41 starting at (275, 211).
; PLAN: r0=275(x), r1=211(y), r2=36(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 211
LDI r2, 36
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
