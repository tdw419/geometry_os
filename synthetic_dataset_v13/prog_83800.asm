; DESCRIPTION: Places a red 31x33 rectangle at position (254, 169).
; PLAN: r0=254(x), r1=169(y), r2=31(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 169
LDI r2, 31
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
