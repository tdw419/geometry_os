; DESCRIPTION: Places a cyan circle of radius 38 at center (198, 56).
; PLAN: r0=198(x), r1=56(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 56
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
