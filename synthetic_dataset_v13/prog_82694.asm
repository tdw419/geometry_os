; DESCRIPTION: Places a cyan circle of radius 41 at center (295, 106).
; PLAN: r0=295(x), r1=106(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 106
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
