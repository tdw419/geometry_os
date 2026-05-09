; DESCRIPTION: Places a cyan circle of radius 65 at center (180, 87).
; PLAN: r0=180(x), r1=87(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 87
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
