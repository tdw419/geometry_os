; DESCRIPTION: Places a white 17x119 rectangle at position (487, 65).
; PLAN: r0=487(x), r1=65(y), r2=17(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 65
LDI r2, 17
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
