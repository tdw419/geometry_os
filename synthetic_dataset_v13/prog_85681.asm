; DESCRIPTION: Places a cyan circle of radius 22 at center (485, 46).
; PLAN: r0=485(x), r1=46(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 485
LDI r1, 46
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
