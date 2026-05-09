; DESCRIPTION: Places a red 31x91 rectangle at position (148, 87).
; PLAN: r0=148(x), r1=87(y), r2=31(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 87
LDI r2, 31
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
