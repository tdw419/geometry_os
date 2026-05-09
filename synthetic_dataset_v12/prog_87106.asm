; DESCRIPTION: Places a cyan circle of radius 37 at center (362, 171).
; PLAN: r0=362(x), r1=171(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 171
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
