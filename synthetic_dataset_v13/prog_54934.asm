; DESCRIPTION: Places a red 51x10 rectangle at position (180, 47).
; PLAN: r0=180(x), r1=47(y), r2=51(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 47
LDI r2, 51
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
