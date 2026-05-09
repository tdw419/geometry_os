; DESCRIPTION: Places a green dot at position (253, 213).
; PLAN: r0=253(x), r1=213(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 213
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
