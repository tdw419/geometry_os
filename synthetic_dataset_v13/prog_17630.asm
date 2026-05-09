; DESCRIPTION: Places a cyan circle of radius 65 at center (209, 79).
; PLAN: r0=209(x), r1=79(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 79
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
