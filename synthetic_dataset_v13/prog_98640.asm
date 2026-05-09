; DESCRIPTION: Places a green dot at position (243, 135).
; PLAN: r0=243(x), r1=135(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 135
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
