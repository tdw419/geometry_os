; DESCRIPTION: Places a red 65x30 rectangle at position (80, 77).
; PLAN: r0=80(x), r1=77(y), r2=65(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 77
LDI r2, 65
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
