; DESCRIPTION: Places a red 57x110 rectangle at position (330, 27).
; PLAN: r0=330(x), r1=27(y), r2=57(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 27
LDI r2, 57
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
