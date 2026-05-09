; DESCRIPTION: Places a red 103x74 rectangle at position (13, 171).
; PLAN: r0=13(x), r1=171(y), r2=103(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 171
LDI r2, 103
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
