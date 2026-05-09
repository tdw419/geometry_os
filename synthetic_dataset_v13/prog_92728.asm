; DESCRIPTION: Places a green 111x86 rectangle at position (149, 75).
; PLAN: r0=149(x), r1=75(y), r2=111(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 75
LDI r2, 111
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
