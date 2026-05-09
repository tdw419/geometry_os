; DESCRIPTION: Renders a cyan box of size 53x13 starting at (285, 241).
; PLAN: r0=285(x), r1=241(y), r2=53(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 241
LDI r2, 53
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
