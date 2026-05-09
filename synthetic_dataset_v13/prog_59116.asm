; DESCRIPTION: Places a yellow 111x19 rectangle at position (31, 231).
; PLAN: r0=31(x), r1=231(y), r2=111(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 231
LDI r2, 111
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
