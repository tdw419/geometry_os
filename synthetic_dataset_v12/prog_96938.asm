; DESCRIPTION: Places a red 65x34 rectangle at position (160, 37).
; PLAN: r0=160(x), r1=37(y), r2=65(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 37
LDI r2, 65
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
