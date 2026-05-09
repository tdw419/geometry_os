; DESCRIPTION: Places a red 56x115 rectangle at position (340, 26).
; PLAN: r0=340(x), r1=26(y), r2=56(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 26
LDI r2, 56
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
