; DESCRIPTION: Places a green dot at position (262, 88).
; PLAN: r0=262(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 262
LDI r1, 88
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
