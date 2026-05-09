; DESCRIPTION: Places a green circle of radius 68 at center (347, 146).
; PLAN: r0=347(x), r1=146(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 146
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
