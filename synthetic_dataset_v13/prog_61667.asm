; DESCRIPTION: Places a yellow 31x47 rectangle at position (178, 98).
; PLAN: r0=178(x), r1=98(y), r2=31(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 98
LDI r2, 31
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
