; DESCRIPTION: Places a red 27x96 rectangle at position (184, 75).
; PLAN: r0=184(x), r1=75(y), r2=27(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 75
LDI r2, 27
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
