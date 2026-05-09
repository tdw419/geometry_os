; DESCRIPTION: Renders a black box of size 37x46 starting at (283, 204).
; PLAN: r0=283(x), r1=204(y), r2=37(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 204
LDI r2, 37
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
