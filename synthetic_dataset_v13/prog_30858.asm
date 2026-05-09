; DESCRIPTION: Places a green dot at position (446, 117).
; PLAN: r0=446(x), r1=117(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 117
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
