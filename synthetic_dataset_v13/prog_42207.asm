; DESCRIPTION: Places a red 93x105 rectangle at position (174, 80).
; PLAN: r0=174(x), r1=80(y), r2=93(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 80
LDI r2, 93
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
