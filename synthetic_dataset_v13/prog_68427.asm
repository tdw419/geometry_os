; DESCRIPTION: Places a yellow dot at position (480, 197).
; PLAN: r0=480(x), r1=197(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 480
LDI r1, 197
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
