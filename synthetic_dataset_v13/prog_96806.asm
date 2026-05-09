; DESCRIPTION: Places a cyan circle of radius 59 at center (214, 175).
; PLAN: r0=214(x), r1=175(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 175
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
