; DESCRIPTION: Places a green 107x112 rectangle at position (370, 31).
; PLAN: r0=370(x), r1=31(y), r2=107(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 31
LDI r2, 107
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
