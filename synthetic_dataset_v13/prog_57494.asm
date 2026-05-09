; DESCRIPTION: Places a green 36x65 rectangle at position (406, 46).
; PLAN: r0=406(x), r1=46(y), r2=36(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 46
LDI r2, 36
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
