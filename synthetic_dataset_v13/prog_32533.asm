; DESCRIPTION: Places a black dot at position (398, 113).
; PLAN: r0=398(x), r1=113(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 113
LDI r2, 0x000000
PSET r0, r1, r2
HALT
