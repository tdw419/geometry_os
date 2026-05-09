; DESCRIPTION: Places a cyan circle of radius 67 at center (243, 85).
; PLAN: r0=243(x), r1=85(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 85
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
