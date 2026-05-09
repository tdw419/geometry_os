; DESCRIPTION: Places a green 106x91 rectangle at position (48, 46).
; PLAN: r0=48(x), r1=46(y), r2=106(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 46
LDI r2, 106
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
