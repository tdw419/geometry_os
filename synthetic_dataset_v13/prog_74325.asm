; DESCRIPTION: Places a orange 93x35 rectangle at position (298, 93).
; PLAN: r0=298(x), r1=93(y), r2=93(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 93
LDI r2, 93
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
