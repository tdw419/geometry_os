; DESCRIPTION: Places a green dot at position (480, 50).
; PLAN: r0=480(x), r1=50(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 480
LDI r1, 50
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
