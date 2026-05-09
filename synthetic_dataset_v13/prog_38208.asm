; DESCRIPTION: Places a red 113x11 rectangle at position (124, 187).
; PLAN: r0=124(x), r1=187(y), r2=113(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 187
LDI r2, 113
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
