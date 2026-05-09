; DESCRIPTION: Places a cyan circle of radius 27 at center (296, 138).
; PLAN: r0=296(x), r1=138(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 138
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
