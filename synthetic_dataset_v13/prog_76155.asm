; DESCRIPTION: Places a green 66x29 rectangle at position (406, 200).
; PLAN: r0=406(x), r1=200(y), r2=66(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 200
LDI r2, 66
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
