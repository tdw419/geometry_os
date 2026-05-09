; DESCRIPTION: Places a magenta 13x44 rectangle at position (386, 121).
; PLAN: r0=386(x), r1=121(y), r2=13(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 121
LDI r2, 13
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
