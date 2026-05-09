; DESCRIPTION: Places a black 24x17 rectangle at position (487, 223).
; PLAN: r0=487(x), r1=223(y), r2=24(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 223
LDI r2, 24
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
