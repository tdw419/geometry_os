; DESCRIPTION: Places a green 80x39 rectangle at position (322, 46).
; PLAN: r0=322(x), r1=46(y), r2=80(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 46
LDI r2, 80
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
