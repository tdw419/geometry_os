; DESCRIPTION: Places a red 82x80 rectangle at position (425, 39).
; PLAN: r0=425(x), r1=39(y), r2=82(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 39
LDI r2, 82
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
