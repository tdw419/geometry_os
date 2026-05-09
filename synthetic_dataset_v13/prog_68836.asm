; DESCRIPTION: Places a red 103x71 rectangle at position (74, 33).
; PLAN: r0=74(x), r1=33(y), r2=103(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 33
LDI r2, 103
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
