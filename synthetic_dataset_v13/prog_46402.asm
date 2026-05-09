; DESCRIPTION: Places a orange 111x18 rectangle at position (296, 66).
; PLAN: r0=296(x), r1=66(y), r2=111(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 66
LDI r2, 111
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
