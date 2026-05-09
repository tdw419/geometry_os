; DESCRIPTION: Places a yellow 31x21 rectangle at position (479, 58).
; PLAN: r0=479(x), r1=58(y), r2=31(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 58
LDI r2, 31
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
