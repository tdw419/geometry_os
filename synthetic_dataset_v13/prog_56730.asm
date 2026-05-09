; DESCRIPTION: Places a red 44x100 rectangle at position (425, 12).
; PLAN: r0=425(x), r1=12(y), r2=44(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 12
LDI r2, 44
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
