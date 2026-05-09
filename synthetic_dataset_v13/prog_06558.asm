; DESCRIPTION: Places a red 51x76 rectangle at position (130, 157).
; PLAN: r0=130(x), r1=157(y), r2=51(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 157
LDI r2, 51
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
