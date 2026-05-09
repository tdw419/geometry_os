; DESCRIPTION: Places a red circle of radius 17 at center (479, 75).
; PLAN: r0=479(x), r1=75(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 75
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
