; DESCRIPTION: Renders a cyan disk with center (85, 168) and radius 59.
; PLAN: r0=85(x), r1=168(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 168
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
