; DESCRIPTION: Places a purple 98x109 rectangle at position (275, 102).
; PLAN: r0=275(x), r1=102(y), r2=98(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 102
LDI r2, 98
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
