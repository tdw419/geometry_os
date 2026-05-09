; DESCRIPTION: Places a yellow 119x18 rectangle at position (262, 178).
; PLAN: r0=262(x), r1=178(y), r2=119(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 178
LDI r2, 119
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
