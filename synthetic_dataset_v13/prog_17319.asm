; DESCRIPTION: Renders a cyan disk with center (320, 187) and radius 59.
; PLAN: r0=320(x), r1=187(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 187
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
