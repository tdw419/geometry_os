; DESCRIPTION: Places a red 65x115 rectangle at position (110, 21).
; PLAN: r0=110(x), r1=21(y), r2=65(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 21
LDI r2, 65
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
