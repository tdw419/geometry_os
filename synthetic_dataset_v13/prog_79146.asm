; DESCRIPTION: Places a red 96x65 rectangle at position (205, 38).
; PLAN: r0=205(x), r1=38(y), r2=96(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 38
LDI r2, 96
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
