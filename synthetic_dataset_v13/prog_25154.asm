; DESCRIPTION: Places a yellow 38x35 rectangle at position (290, 161).
; PLAN: r0=290(x), r1=161(y), r2=38(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 161
LDI r2, 38
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
