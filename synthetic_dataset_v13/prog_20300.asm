; DESCRIPTION: Places a red 113x26 rectangle at position (305, 199).
; PLAN: r0=305(x), r1=199(y), r2=113(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 199
LDI r2, 113
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
