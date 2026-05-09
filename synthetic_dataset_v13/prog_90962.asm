; DESCRIPTION: Creates a red circular shape at (362, 205) with radius 46.
; PLAN: r0=362(x), r1=205(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 205
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
