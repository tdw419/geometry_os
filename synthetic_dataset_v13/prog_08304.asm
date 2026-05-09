; DESCRIPTION: Places a white 23x44 rectangle at position (107, 193).
; PLAN: r0=107(x), r1=193(y), r2=23(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 193
LDI r2, 23
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
