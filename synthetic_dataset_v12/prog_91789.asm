; DESCRIPTION: Places a green circle of radius 16 at center (208, 117).
; PLAN: r0=208(x), r1=117(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 117
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
