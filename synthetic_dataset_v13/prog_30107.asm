; DESCRIPTION: Renders a orange disk with center (79, 187) and radius 57.
; PLAN: r0=79(x), r1=187(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 187
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
