; DESCRIPTION: Places a green 18x35 rectangle at position (202, 46).
; PLAN: r0=202(x), r1=46(y), r2=18(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 46
LDI r2, 18
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
