; DESCRIPTION: Places a red 105x81 rectangle at position (202, 171).
; PLAN: r0=202(x), r1=171(y), r2=105(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 171
LDI r2, 105
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
