; DESCRIPTION: Places a yellow 107x54 rectangle at position (405, 70).
; PLAN: r0=405(x), r1=70(y), r2=107(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 70
LDI r2, 107
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
