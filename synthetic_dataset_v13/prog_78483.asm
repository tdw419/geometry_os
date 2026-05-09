; DESCRIPTION: Places a red 107x115 rectangle at position (23, 37).
; PLAN: r0=23(x), r1=37(y), r2=107(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 37
LDI r2, 107
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
