; DESCRIPTION: Places a magenta dot at position (8, 154).
; PLAN: r0=8(x), r1=154(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 154
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
