; DESCRIPTION: Renders a red disk with center (404, 149) and radius 51.
; PLAN: r0=404(x), r1=149(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 149
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
