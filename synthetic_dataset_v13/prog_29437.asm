; DESCRIPTION: Places a cyan circle of radius 39 at center (392, 124).
; PLAN: r0=392(x), r1=124(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 124
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
