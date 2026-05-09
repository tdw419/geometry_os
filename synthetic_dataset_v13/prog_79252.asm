; DESCRIPTION: Places a black 119x35 rectangle at position (298, 19).
; PLAN: r0=298(x), r1=19(y), r2=119(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 19
LDI r2, 119
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
