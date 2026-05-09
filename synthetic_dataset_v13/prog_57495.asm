; DESCRIPTION: Places a white 108x57 rectangle at position (125, 193).
; PLAN: r0=125(x), r1=193(y), r2=108(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 193
LDI r2, 108
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
