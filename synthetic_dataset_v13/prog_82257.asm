; DESCRIPTION: Places a cyan 97x91 rectangle at position (184, 46).
; PLAN: r0=184(x), r1=46(y), r2=97(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 46
LDI r2, 97
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
