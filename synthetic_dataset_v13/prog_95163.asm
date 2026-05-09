; DESCRIPTION: Places a green dot at position (161, 210).
; PLAN: r0=161(x), r1=210(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 210
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
