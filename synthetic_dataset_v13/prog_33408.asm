; DESCRIPTION: Creates a orange circular shape at (362, 205) with radius 51.
; PLAN: r0=362(x), r1=205(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 205
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
