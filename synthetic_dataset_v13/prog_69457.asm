; DESCRIPTION: Places a yellow 111x66 rectangle at position (161, 161).
; PLAN: r0=161(x), r1=161(y), r2=111(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 161
LDI r2, 111
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
