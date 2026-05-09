; DESCRIPTION: Places a yellow 65x28 rectangle at position (70, 212).
; PLAN: r0=70(x), r1=212(y), r2=65(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 212
LDI r2, 65
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
