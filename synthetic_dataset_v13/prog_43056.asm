; DESCRIPTION: Places a cyan circle of radius 14 at center (433, 207).
; PLAN: r0=433(x), r1=207(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 207
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
