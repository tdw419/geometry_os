; DESCRIPTION: Places a magenta dot at position (192, 113).
; PLAN: r0=192(x), r1=113(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 113
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
