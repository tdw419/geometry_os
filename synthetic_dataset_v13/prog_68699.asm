; DESCRIPTION: Places a red 89x36 rectangle at position (346, 29).
; PLAN: r0=346(x), r1=29(y), r2=89(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 29
LDI r2, 89
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
