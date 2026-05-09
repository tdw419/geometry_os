; DESCRIPTION: Places a red circle of radius 36 at center (447, 125).
; PLAN: r0=447(x), r1=125(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 125
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
