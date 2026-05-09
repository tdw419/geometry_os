; DESCRIPTION: Places a green dot at position (146, 239).
; PLAN: r0=146(x), r1=239(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 239
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
