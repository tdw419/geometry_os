; DESCRIPTION: Places a white circle of radius 46 at center (298, 206).
; PLAN: r0=298(x), r1=206(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 206
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
