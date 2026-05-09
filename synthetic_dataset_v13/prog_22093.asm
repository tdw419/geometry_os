; DESCRIPTION: Places a cyan circle of radius 51 at center (333, 111).
; PLAN: r0=333(x), r1=111(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 111
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
