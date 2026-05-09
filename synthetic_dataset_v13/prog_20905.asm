; DESCRIPTION: Places a red 103x92 rectangle at position (271, 136).
; PLAN: r0=271(x), r1=136(y), r2=103(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 136
LDI r2, 103
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
