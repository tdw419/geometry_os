; DESCRIPTION: Places a red 93x47 rectangle at position (305, 51).
; PLAN: r0=305(x), r1=51(y), r2=93(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 51
LDI r2, 93
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
