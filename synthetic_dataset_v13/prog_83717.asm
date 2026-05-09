; DESCRIPTION: Places a green 65x91 rectangle at position (38, 106).
; PLAN: r0=38(x), r1=106(y), r2=65(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 106
LDI r2, 65
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
