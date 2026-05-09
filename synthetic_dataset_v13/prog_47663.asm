; DESCRIPTION: Places a green dot at position (154, 103).
; PLAN: r0=154(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 103
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
