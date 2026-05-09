; DESCRIPTION: Places a yellow 38x75 rectangle at position (273, 120).
; PLAN: r0=273(x), r1=120(y), r2=38(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 120
LDI r2, 38
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
