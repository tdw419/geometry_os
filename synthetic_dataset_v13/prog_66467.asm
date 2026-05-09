; DESCRIPTION: Places a purple 24x44 rectangle at position (479, 41).
; PLAN: r0=479(x), r1=41(y), r2=24(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 41
LDI r2, 24
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
