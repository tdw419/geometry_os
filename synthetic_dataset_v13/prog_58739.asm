; DESCRIPTION: Places a blue 102x17 rectangle at position (386, 233).
; PLAN: r0=386(x), r1=233(y), r2=102(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 233
LDI r2, 102
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
