; DESCRIPTION: Places a yellow 35x113 rectangle at position (45, 57).
; PLAN: r0=45(x), r1=57(y), r2=35(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 57
LDI r2, 35
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
