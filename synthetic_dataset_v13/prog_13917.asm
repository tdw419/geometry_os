; DESCRIPTION: Draws a cyan circle centered at (182, 93) with radius 59.
; PLAN: r0=182(x), r1=93(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 93
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
