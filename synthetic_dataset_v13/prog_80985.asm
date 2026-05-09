; DESCRIPTION: Renders a cyan disk with center (404, 149) and radius 16.
; PLAN: r0=404(x), r1=149(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 149
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
