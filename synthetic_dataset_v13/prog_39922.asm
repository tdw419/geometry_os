; DESCRIPTION: Places a black 55x115 rectangle at position (386, 57).
; PLAN: r0=386(x), r1=57(y), r2=55(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 57
LDI r2, 55
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
