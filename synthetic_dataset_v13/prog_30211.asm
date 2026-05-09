; DESCRIPTION: Renders a cyan disk with center (465, 127) and radius 30.
; PLAN: r0=465(x), r1=127(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 127
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
