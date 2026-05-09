; DESCRIPTION: Places a orange circle of radius 39 at center (213, 143).
; PLAN: r0=213(x), r1=143(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 143
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
