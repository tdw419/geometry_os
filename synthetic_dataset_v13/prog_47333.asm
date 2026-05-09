; DESCRIPTION: Renders a cyan disk with center (408, 68) and radius 46.
; PLAN: r0=408(x), r1=68(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 68
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
