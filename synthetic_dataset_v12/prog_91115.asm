; DESCRIPTION: Sets a single yellow pixel at (404, 228).
; PLAN: r0=404(x), r1=228(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 404
LDI r1, 228
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
