; DESCRIPTION: Places a orange 99x120 rectangle at position (285, 27).
; PLAN: r0=285(x), r1=27(y), r2=99(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 27
LDI r2, 99
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
