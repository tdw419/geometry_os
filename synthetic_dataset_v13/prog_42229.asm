; DESCRIPTION: Places a green dot at position (412, 243).
; PLAN: r0=412(x), r1=243(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 412
LDI r1, 243
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
