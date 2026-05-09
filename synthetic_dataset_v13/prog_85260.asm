; DESCRIPTION: Places a cyan circle of radius 56 at center (185, 146).
; PLAN: r0=185(x), r1=146(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 146
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
